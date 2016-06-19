require 'test_helper'

class ReportsControllerTest < ActionController::TestCase

  include Devise::TestHelpers

  setup do
    sign_in users(:admin)
    @report = ""
  end

  test "reaches index" do
    get :index
    assert_response :success
  end

end
