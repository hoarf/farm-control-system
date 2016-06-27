require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:admin)
  end

  test "login use case" do
    login_routine
    assert_equal '/', path
  end

  test "logoff use case" do
    login_routine
    get '/reports'
    assert_response :success
    delete_via_redirect '/users/sign_out'
    assert_response :success
    assert_equal '/', path
  end

  test "sign up use case" do
    get '/users/sign_up'
    assert_response :success
    post_via_redirect "/users",
                      'user[email]': "someotherguy@microsoft.com",
                      'user[password]': "pokemon",
                      'user[password_confirmation]': "pokemon"
    assert_response :success
    assert_equal '/', path

  end

  private

  def login_routine
    https!
    get '/users/sign_in'
    assert_response :success
    post_via_redirect "/users/sign_in",
                      'user[email]': @user.email,
                      'user[password]': ENV["admin_account_password"]

  end
end
