# TemplateApp API
A template API Rails 7 project. Yay!
Ruby version: 3.2.2

##  Getting started
Replace every occurrence of `TemplateApp` with the app name you want in this format, and replace every occurrence of`template_app` with the same app name in this underline format.

Environment variables are stored in `.env`. A sample file was provided, run `mv .env.sample .env` to rename it so `rails-dotenv` can read them in runtime.
Then do the same for `database.yml` with: `mv config/database.yml.sample  config/database.yml`.

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
  ```
### Database
  TemplateApp API uses PostgreSQL. After setting up your PostgreSQL user, create and migrate the database with:
  ```
  bundle exec rails db:create
  bundle exec rails db:migrate
  ```
### Test suite
  To run the test suite, simply run `bundle exec rspec`. Or to have `rspec-watcher` do that for you, use `RAILS_ENV=test bundle exec rake rspec_watcher:watch`

### Deployment
  To deploy to Heroku
  `bundle exec rake deploy:staging`
  `bundle exec rake deploy:development`
  `bundle exec rake deploy:production`

