class OrdersController < ApplicationController
  allow_unauthenticated_access only: %i[ new create show ]

  def new
    @order = Order.new
    @cart = Current.cart
    if @cart.line_items.empty?
      redirect_to root_path, alert: "Your cart is empty."
    end
  end

  def create
    @order = Order.new(order_params)
    @cart = Current.cart

    if @cart.line_items.empty?
      redirect_to root_path, alert: "Your cart is empty."
      return
    end

    ActiveRecord::Base.transaction do
      if @order.save
        @cart.line_items.each do |item|
          item.update!(
            order: @order,
            cart: nil,
            price: item.product.price
          )
        end
        @order.update!(total: @order.line_items.sum { |li| li.price * li.quantity })
        session.delete(:cart_id)
        redirect_to @order, notice: "Thank you for your order!"
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private
    def order_params
      params.require(:order).permit(:email_address)
    end
end
