require 'test_helper'

class DealsControllerTest < ActionController::TestCase

  include Devise::TestHelpers

  setup do
    sign_in users(:admin)
    @deal = deals(:purchase)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deal" do
    assert_difference('Deal.count') do
      post :create, deal: { date: @deal.date, dead_weight: @deal.dead_weight, deal_type: @deal.deal_type, females: @deal.females, live_weight: @deal.live_weight, males: @deal.males, partner_id: @deal.partner_id, price: @deal.price, reason: @deal.reason }
    end

    assert_redirected_to deal_path(assigns(:deal))
  end

  test "should show deal" do
    get :show, id: @deal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @deal
    assert_response :success
  end

  test "should update deal" do
    patch :update, id: @deal, deal: { date: @deal.date, dead_weight: @deal.dead_weight, deal_type: @deal.deal_type, females: @deal.females, live_weight: @deal.live_weight, males: @deal.males, partner_id: @deal.partner_id, price: @deal.price, reason: @deal.reason }
    assert_redirected_to deal_path(assigns(:deal))
  end

  test "should destroy deal" do
    assert_difference('Deal.count', -1) do
      delete :destroy, id: @deal
    end

    assert_redirected_to deals_path
  end
end
