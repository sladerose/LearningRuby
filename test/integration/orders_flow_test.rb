require "test_helper"

class OrdersFlowTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "guest user can checkout" do
    get root_path
    post line_items_path, params: { product_id: @product.id }
    follow_redirect!
    
    get new_order_path
    assert_response :success
    assert_select "h1", text: "Complete Your Purchase"
    
    assert_difference('Order.count', 1) do
      post orders_path, params: { order: { email_address: "guest@example.com" } }
    end
    
    assert_redirected_to order_path(Order.last)
    follow_redirect!
    
    assert_select "h1", text: "Thank you for your order!"
    assert_select "p", text: /Order #/
    
    # Verify cart is cleared
    get cart_path
    assert_select "p", text: "Your cart is empty."
  end
end
