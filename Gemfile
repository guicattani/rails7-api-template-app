# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails", "~> 7.1.3", ">= 7.1.3.2"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.2", require: false

# ENV variables
gem "dotenv"

group :development, :test do
  gem "factory_bot_rails"
  gem "faker"
  gem "pry-byebug"
end

group :development do
  gem "rubocop"
  gem "rubocop-factory_bot"
  gem "rubocop-rails"
  gem "rubocop-rspec"
  gem "rubocop-rspec_rails"
end

group :test do
  gem "database_cleaner"
  gem "rspec-rails"
  gem 'rspec-watcher'
  gem "shoulda-matchers", require: false
  gem "simplecov"
end
