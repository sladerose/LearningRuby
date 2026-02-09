require "test_helper"

class ShoppingCartTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "guest user can add item to cart" do
    get root_path
    assert_response :success
    assert_select "h1", /my_shop/

    post line_items_path, params: { product_id: @product.id }
    assert_redirected_to root_path
    follow_redirect!
    assert_select "div#notice", text: "Added #{@product.name} to cart."

    get cart_path
    assert_response :success
    assert_select "h2", "Shopping Cart"
    assert_select "h3", @product.name
    assert_select "a", text: "Checkout Now"
  end
end
