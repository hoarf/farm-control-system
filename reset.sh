bundle exec rake db:drop
bundle exec rake db:create
rm db/schema.rb
bundle exec rake db:migrate
bundle exec rake db:seed

