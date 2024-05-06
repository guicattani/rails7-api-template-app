# frozen_string_literal: true

require 'rake'
require 'active_record'
require 'shoulda/matchers'
require 'database_cleaner'
require 'pry'
require 'dotenv'
Dotenv.load

RSpec.configure do |config|
  if ENV["USE_TEST_CONTAINERS"]&.downcase == "true"
    config.add_setting :postgres_container, default: nil

    config.before(:suite) do
      begin
        config.postgres_container = Testcontainers::PostgresContainer.new.start
        ENV["DATABASE_URL"] = config.postgres_container.database_url

        Rails.application.load_tasks
        Rake::Task['db:test:prepare'].invoke
        ActiveRecord::Migration.maintain_test_schema!
      rescue ActiveRecord::PendingMigrationError => e
        abort e.to_s.strip
      end
    end

    config.after(:suite) do
      config.postgres_container&.stop
      config.postgres_container&.remove
    end
  end

  config.example_status_persistence_file_path = "./spec/examples.txt"
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups

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
