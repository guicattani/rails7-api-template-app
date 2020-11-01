# frozen_string_literal: true

require 'factory_bot_rails'
require 'dotenv'
require 'pry'
Dotenv.load

RSpec.configure do |config|
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  Dir['./spec/support/**/*.rb'].sort.each { |f| require f }

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
