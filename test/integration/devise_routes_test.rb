require 'test_helper'

class DeviseRoutesTest < ActionDispatch::IntegrationTest

  test "recognizes GET welcome#index as root" do
    assert_recognizes({controller: 'welcome', action: 'index'}, '')
  end

  test "recognizes GET users#sign_in" do
    assert_recognizes({controller: 'devise/sessions', action: 'new'}, 'users/sign_in')
  end

  test "recognizes POST users#sign_in" do
    assert_recognizes({controller: 'devise/sessions', action: 'create'},
                      {path: 'users/sign_in', method: :post})
  end

  test "recognizes DELETE users#sign_out" do
    assert_recognizes({controller: 'devise/sessions', action: 'destroy'},
                      {path: 'users/sign_out', method: :delete})
  end

  test "recognizes GET users#sign_up" do
    assert_recognizes({controller: 'devise/registrations', action: 'new'}, 'users/sign_up')
  end

  test "recognizes GET users#cancel" do
    assert_recognizes({controller: 'devise/registrations', action: 'cancel'}, 'users/cancel')
  end

  test "recognizes GET users#edit" do
    assert_recognizes({controller: 'devise/registrations', action: 'edit'}, 'users/edit')
  end

  test "recognizes PATCH users" do
    assert_recognizes({controller: 'devise/registrations', action: 'update'},
                      {path: 'users', method: :patch})
  end

  test "recognizes DELETE users" do
    assert_recognizes({controller: 'devise/registrations', action: 'destroy'},
                      {path: 'users', method: :delete})
  end

end
