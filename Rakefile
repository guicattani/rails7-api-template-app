require_relative 'config/application'

Rails.application.load_tasks

if Rails.env.development?
  require "rusky/task"
  Rusky::Task.install
end
