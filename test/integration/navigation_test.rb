# coding: utf-8
require 'test_helper'

class NavigationTest < Capybara::Rails::TestCase

  feature "layout contain right links" do
    scenario "after user login" do
      sign_in_user
      page.must_have_link "Cadastrar negócio"
      page.must_have_link "Cadastrar contato"
      page.must_have_link "Relatório"
    end

    scenario "before user login" do
      visit root_path
      page.must_have_link "Entrar no site"
      page.must_have_link "Cadastrar"
      page.wont_have_link "Relatório"
    end
  end
end
