# frozen_string_literal: true

require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "rails/test_unit/railtie"
# Pick the frameworks you want:
# require "active_storage/engine"
# require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
# require "action_view/railtie"
# require "action_cable/engine"
Bundler.require(*Rails.groups)

module TemplateAppApi
  class Application < Rails::Application
    config.load_defaults 8.0
    config.api_only = true
    config.debug_exception_response_format = :api
    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
