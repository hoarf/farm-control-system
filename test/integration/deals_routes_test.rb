require 'test_helper'

class DealsRoutesTest < ActionDispatch::IntegrationTest

  test "recognizes GET deals#index" do
    assert_recognizes({controller: 'deals', action: 'index'}, 'deals')
  end

  test "recognizes POST deals#create" do
    assert_recognizes({controller: 'deals', action: 'create'},
                      {path: 'deals', method: :post})
  end

  test "recognizes GET deals#new" do
    assert_recognizes({controller: 'deals', action: 'new'}, 'deals/new')
  end

  test "recognizes GET deals#edit" do
    assert_recognizes({controller: 'deals', action: 'edit', id: '1'}, 'deals/1/edit')
  end

  test "recognizes GET deals#show" do
    assert_recognizes({controller: 'deals', action: 'show', id: '1'}, 'deals/1')
  end

  test "recognizes PATCH deals#update" do
    assert_recognizes({controller: 'deals', action: 'update', id: '1'},
                      {path: 'deals/1', method: :patch})
  end

  test "recognizes PUT deals#update" do
    assert_recognizes({controller: 'deals', action: 'update', id: '1'},
                      {path: 'deals/1', method: :put})
  end

  test "recognizes DELETE deals#destroy" do
    assert_recognizes({controller: 'deals', action: 'destroy', id: '1'},
                      {path: 'deals/1', method: :delete})
  end
end
