require 'test_helper'

class OtherRoutesTests < ActionDispatch::IntegrationTest

  test "recognizes GET welcome#index as root" do
    assert_recognizes({controller: 'welcome', action: 'index'}, '')
  end

  test "recognizes GET report#index" do
    assert_recognizes({controller: 'reports', action: 'index'}, '/reports')
  end

end
