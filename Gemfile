source 'https://rubygems.org'

ruby "2.2.6"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

group :production do
# See https://github.com/rails/execjs#readme for more supported runtimes
  gem 'therubyracer', platforms: :ruby
end

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks', '~> 2.5.3'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Postgres
gem 'pg'

# Authentication
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'devise'

# Haml
gem 'haml'

# Who wants to keep writing divs amirite?
gem 'simple_form'

# Haml generator
gem 'haml-rails', '~> 0.9'

# CSS
gem 'bootstrap-sass'
gem 'bootstrap_sb_admin_base_v2'

# Nested Forms
gem 'cocoon'

# Datatables
gem 'jquery-datatables-rails', '~> 3.4.0'

# Pagination
gem "kaminari"

#Chartjs
gem 'chartjs-ror'

#Hashs are everywhere
gem 'ruby_dig'

#FUCK SQL
gem 'arel-helpers'

#OK SQL IS COOL I GUESS
gem 'scenic'

group :development do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console


  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'


end

group :test, :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'guard'
  gem 'guard-minitest'
  gem 'byebug'
end

group :test do
  gem 'minitest-reporters'
  gem "capybara"
  gem "connection_pool"
  gem "launchy"
  gem "mocha"
  gem "poltergeist"
  gem "shoulda-context"
  gem "shoulda-matchers", ">= 3.0.1"
  gem "test_after_commit"
  gem 'minitest-rails'
  gem 'minitest-rails-capybara'
end
