module SetCart
  extend ActiveSupport::Concern

  included do
    before_action :set_cart
  end

  private
    def set_cart
      if session[:cart_id]
        Current.cart = Cart.find_by(id: session[:cart_id])
      end

      if Current.cart.nil?
        Current.cart = Cart.create!
        session[:cart_id] = Current.cart.id
      end
    end
end
