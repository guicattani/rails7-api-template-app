# frozen_string_literal: true

ENV['RAILS_ENV'] = 'test'
require File.expand_path('../config/environment', __dir__)
abort('Rails is running in production mode!') if Rails.env.production?

require 'spec_helper'
require 'simplecov'
require 'rspec/rails'
require 'factory_bot_rails'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].sort.each { |f| require f }
Dir["#{File.dirname(__FILE__)}/helpers/**/*.rb"].sort.each { |f| require f }
Dir["#{File.dirname(__FILE__)}../app/helpers/**/*.rb"].sort.each { |f| require f }

SimpleCov.start

RSpec.configure do |config|
  config.include(FactoryBot::Syntax::Methods)
  config.formatter = :documentation
end
