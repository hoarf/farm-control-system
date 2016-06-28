ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"

require "mocha/mini_test"

# Improved Minitest output (color and progress bar)
require "minitest/reporters"
Minitest::Reporters.use!(
  Minitest::Reporters::ProgressReporter.new,
  ENV,
  Minitest.backtrace_filter)

# Capybara and poltergeist integration
require "capybara/rails"
require "capybara/poltergeist"
Capybara.javascript_driver = :poltergeist

require "minitest/rails"
require "minitest/spec"
require "minitest/rails/capybara"

class ActiveSupport::TestCase
  fixtures :all
end

class Capybara::Rails::TestCase
  fixtures :all
  def sign_in_user
    visit new_user_session_path

    fill_in "Email", :with => users(:admin).email
    fill_in "Password", :with => ENV['admin_account_password']
    click_button "Log in"

    page.must_have_content "Logado como #{users(:admin).email}"
  end
end

# See: https://gist.github.com/mperham/3049152
class ActiveRecord::Base
  mattr_accessor :shared_connection
  @@shared_connection = nil

  def self.connection
    @@shared_connection || ConnectionPool::Wrapper.new(:size => 1) { retrieve_connection }
  end
end
ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection

class ActiveSupport::TestCase
  fixtures :all
end
