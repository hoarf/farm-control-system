# coding: utf-8
require "test_helper"

class DealsTest < Capybara::Rails::TestCase

  subject { deals(:compra) }

  feature "create deal from report page" do

    background "user signs in and fill the form in" do
      sign_in_user
      click_link "Cadastrar negócio"
    end

    scenario "is a valid deal" do
      puts page.html

      page.must_have_content "asdkja"
    end
  end
end
