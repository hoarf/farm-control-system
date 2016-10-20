require 'test_helper'

class FarmsControllerTest < ActionController::TestCase
  setup do
    @farm = farms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:farms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create farm" do
    assert_difference('Farm.count') do
      post :create, farm: { show: @farm.show }
    end

    assert_redirected_to farm_path(assigns(:farm))
  end

  test "should show farm" do
    get :show, id: @farm
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @farm
    assert_response :success
  end

  test "should update farm" do
    patch :update, id: @farm, farm: { show: @farm.show }
    assert_redirected_to farm_path(assigns(:farm))
  end

  test "should destroy farm" do
    assert_difference('Farm.count', -1) do
      delete :destroy, id: @farm
    end

    assert_redirected_to farms_path
  end
end
