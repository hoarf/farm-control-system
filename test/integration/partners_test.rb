require "test_helper"

class PartnersTest < Capybara::Rails::TestCase

  subject { partners(:cooperativa) }
  feature "create partner from report page" do

    background "user signs in and fill the form in" do
      sign_in_user
      click_link "Cadastrar contato"
      page.must_have_content "Novo contato"
      fill_in "Name", :with => subject.name
      fill_in "Contact", :with => subject.contact
      click_button "Salvar"
    end

    scenario "contact was valid" do
      page.must_have_content "Contato cadastrado com sucesso"
    end

  end
end
