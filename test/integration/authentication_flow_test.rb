require "test_helper"

class AuthenticationFlowTest < ActionDispatch::IntegrationTest
  test "can sign up and login" do
    get "/registration/new"
    assert_response :success

    post "/registration", params: { user: { email_address: "newuser@example.com", password: "password", password_confirmation: "password" } }
    assert_redirected_to root_path
    follow_redirect!
    assert_response :success
    # Look for logout link text or href
    assert_select "a[href=?]", session_path, text: "Logout"

    delete "/session"
    assert_redirected_to new_session_path # usually redirects to root or login
    follow_redirect!
    assert_select "a[href=?]", new_session_path, text: "Sign in"
  end

  test "cannot access protected page without login" do
    get "/posts/new"
    assert_redirected_to new_session_path
  end
end
