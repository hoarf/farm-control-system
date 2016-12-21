require "test_helper"

class InventoriesControllerTest < ActionController::TestCase

  def inventory
    @inventory ||= inventories :males
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:inventories)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Inventory.count") do
      post :create, inventory: {  }
    end

    assert_redirected_to inventory_path(assigns(:inventory))
  end

  def test_show
    get :show, id: inventory
    assert_response :success
  end

  def test_edit
    get :edit, id: inventory
    assert_response :success
  end

  def test_update
    put :update, id: inventory, inventory: {  }
    assert_redirected_to inventory_path(assigns(:inventory))
  end

  def test_destroy
    assert_difference("Inventory.count", -1) do
      delete :destroy, id: inventory
    end

    assert_redirected_to inventories_path
  end
end
