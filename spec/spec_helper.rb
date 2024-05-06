# frozen_string_literal: true

RSpec.configure do |config|
  config.example_status_persistence_file_path = "./spec/examples.txt"
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups

  if ENV["USE_TEST_CONTAINERS"]&.downcase == "true"
    config.add_setting :postgres_container, default: nil

    config.before(:suite) do
      config.postgres_container = Testcontainers::PostgresContainer.new.start
      ENV["DATABASE_URL"] = config.postgres_container.database_url # or you can expose it to a fixed port and use database.yml for configuration
    end

    config.after(:suite) do
      config.postgres_container&.stop
      config.postgres_container&.remove
    end
  end
end
