class CartsController < ApplicationController
  allow_unauthenticated_access

  def show
    @cart = Current.cart
  end
end
