namespace :db do
  namespace :test do
    desc 'Creates the test database if none exists and migrates it'
    task :prepare do
      Rails.env = 'test'
      Rake::Task['db:prepare'].invoke
    end
  end
end