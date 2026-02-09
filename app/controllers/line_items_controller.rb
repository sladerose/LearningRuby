class LineItemsController < ApplicationController
  allow_unauthenticated_access

  def create
    product = Product.find(params[:product_id])
    @line_item = Current.cart.line_items.find_or_initialize_by(product: product)
    @line_item.quantity += 1 unless @line_item.new_record?
    
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to root_path, notice: "Added #{product.name} to cart." }
        format.turbo_stream
      else
        format.html { redirect_to root_path, alert: "Could not add item to cart." }
      end
    end
  end

  def update
    @line_item = Current.cart.line_items.find(params[:id])
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to cart_path, notice: "Cart updated." }
        format.turbo_stream
      else
        format.html { redirect_to cart_path, alert: "Could not update item." }
      end
    end
  end

  def destroy
    @line_item = Current.cart.line_items.find(params[:id])
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_path, notice: "Item removed." }
      format.turbo_stream
    end
  end

  private
    def line_item_params
      params.require(:line_item).permit(:quantity)
    end
end
