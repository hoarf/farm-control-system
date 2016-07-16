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
      fill_in "Preço por Kilo", :with => 4.5
      fill_in "Número de Machos", :with => 49
      fill_in "Número de Fêmeas", :with => 30
      fill_in "Peso Vivo (Média)", :with => 300
      fill_in "Peso Morto (Média)", :with => 500

      click_button "Cadastrar Negócio"



    end
  end
end
