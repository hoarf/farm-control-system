require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase

  include Devise::TestHelpers
  setup do 
    sign_out users(:admin)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
