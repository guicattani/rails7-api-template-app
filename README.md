# TemplateApp API
A template API Rails 8 project. Yay!
Ruby version: 3.4.4

Checkout [rails8-vite-react-template](https://github.com/guicattani/rails8-vite-react-template) if you want the Vite + React version of this template. :)

##  Getting started
1. Environment variables are stored in `.env`. A sample file was provided, run `cp .env.sample .env` to copy to the correct name it so `rails-dotenv` can read them in runtime.
Then do the same for `database.yml` with: `cp config/database.yml.sample  config/database.yml`. You need also change the occurrences of `CHANGEME` found in these config files.

2. Replace every occurrence of `TemplateApp` with the app name you want in this format, and replace every occurrence of`template_app` with the same app name in this underline format and case sensitively.

3. Run `touch config/master.key | rails secret` to create a `master.key`.

### Gems used:
  ```
    database_cleaner
    dotenv-rails
    pg
    rubocop
    rspec-rails
    rspec-watcher
    simplecov
    shoulda-matchers
    test-containers (can be used or not with USE_TEST_CONTAINERS env variable)
  ```
### Database
  TemplateApp API uses PostgreSQL. After setting up your PostgreSQL user, create and migrate the database with:
  ```
  bundle exec rails db:create db:migrate
  ```
### Test suite
  To run the test suite, simply run `bundle exec rspec`. Or to have `rspec-watcher` do that for you, use `RAILS_ENV=test bundle exec rake rspec_watcher:watch`

  A default test has been setup to do a health check on the installation and it is located at `spec/requests/root_spec.rb`. Remember to remove this test, the route from `config/routes.rb` and the controller from `app/controllers/root_controller.rb` after setting everything up.

  [TestContainers](https://github.com/testcontainers/testcontainers-ruby/tree/main/postgres) has been added to this repo, but you may remove it if it doesn't make sense to your case as if your system can spin up Docker containers fast enough and\or your test suite is big enough for it to make a difference.

## Docker
  A simple Dockerfile and Docker Compose file have been created to bootstrap everything neatly.

  Be mindful that containers running inside of containers is not recommended, therefore tests shouldn't be run with TestContainers in the Docker environment.

  The default exposed port is `3009` on the host machine, change it on Docker Compose if you experience issues.

### Deployment
  To deploy to Heroku
  `bundle exec rake deploy:staging`
  `bundle exec rake deploy:development`
  `bundle exec rake deploy:production`

