source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :production do
  gem 'coverband'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'rubocop', '~> 1.1'
  gem 'rubocop-daemon', require: false
  gem 'pry-byebug'
end

group :development do
  gem 'guard-rspec', require: false
  gem 'rusky'
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :test do
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'shoulda-matchers', require: false
  gem 'simplecov'
end


