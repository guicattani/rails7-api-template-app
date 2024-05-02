# frozen_string_literal: true

ENV['RAILS_ENV'] = 'test'
require File.expand_path('../config/environment', __dir__)
abort('Rails is running in production mode!') if Rails.env.production?

require 'simplecov'
require 'rspec/rails'
require 'factory_bot_rails'
require 'shoulda/matchers'
require 'database_cleaner'
require 'pry'
require 'dotenv'
Dotenv.load

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].sort.each { |f| require f }
Dir["#{File.dirname(__FILE__)}/helpers/**/*.rb"].sort.each { |f| require f }
Dir["#{File.dirname(__FILE__)}../app/helpers/**/*.rb"].sort.each { |f| require f }

SimpleCov.start

RSpec.configure do |config|
  config.include(FactoryBot::Syntax::Methods)
  config.include(Shoulda::Matchers::ActiveModel, type: :model)
  config.include(Shoulda::Matchers::ActiveRecord, type: :model)

  config.before(:suite) do
    # The :transaction strategy prevents :after_commit hooks from running
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do |_example|
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
