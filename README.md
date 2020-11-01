# TemplateApp API

Template API Rails 6 project
Replace every occurrence of `TemplateApp` with the app name you want in this format, and replace every occurrence of`template_app` with the same app name in this underline format.

Gems used:
```
  coverband
  database_cleaner
  dotenv-rails
  guard-rspec
  pry-byebug
  pg
  rubocop
  rubocop-daemon
  rusky
  rspec-rails
  spring
  simplecov
  shoulda-matchers
```

- Ruby version: 2.7.2
- Configuration:
  Environment variables are stored in `.env`. A sample file was provided, run `mv .env.sample .env` to rename it so `rails-dotenv` can read them in runtime.

- Database
  TemplateApp API uses PostgreSQL by default. Create and migrate the database with:
  ```
  rails db:create
  rails db:migrate
  ```

- How to run the test suite
  After DB creation and migration, simply run `rspec`.

- Deployment instructions
  To deploy to Heroku
  `bundle exec rake deploy:staging`
  `bundle exec rake deploy:development`
  `bundle exec rake deploy:production`
