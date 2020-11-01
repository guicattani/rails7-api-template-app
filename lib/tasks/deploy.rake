# frozen_string_literal: true

namespace :deploy do
  desc 'Backend deploy'

  task :development do
    deploy(develop_app_name)
  end

  task :staging do
    deploy(staging_app_name)
  end

  task :production do
    deploy(production_app_name)
  end

  private

  def staging_app_name
    ENV['HEROKU_STAGING_APP']
  end

  def production_app_name
    ENV['HEROKU_PRODUCTION_APP']
  end

  def develop_app_name
    ENV['HEROKU_DEVELOPMENT_APP']
  end

  def deploy(app)
    system "git push -f #{app} #{branch}:master"
    system "heroku run rake db:migrate -a #{app}"
    system "heroku restart -a #{app}"
  end
end
