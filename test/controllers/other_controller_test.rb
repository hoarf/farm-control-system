require 'test_helper'

class OtherControllerTest < ActionController::TestCase
  test "should get farmyourself" do
    get :farmyourself
    assert_response :success
  end

end
