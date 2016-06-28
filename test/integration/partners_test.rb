require "test_helper"

class PartnersTest < Capybara::Rails::TestCase

  feature "can access home" do

    scenario "not logged yet" do
      login_routine
      visit root_path


    end
  end

end
