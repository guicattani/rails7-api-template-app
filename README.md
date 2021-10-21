# TemplateApp API
A template API Rails 6 project. Yay! 
Ruby version: 2.7.4

##  Getting started
Replace every occurrence of `TemplateApp` with the app name you want in this format, and replace every occurrence of`template_app` with the same app name in this underline format.

Environment variables are stored in `.env`. A sample file was provided, run `mv .env.sample .env` to rename it so `rails-dotenv` can read them in runtime.
Then do the same for `database.yml` with: `mv config/database.yml.sample  config/database.yml`.

### Gems used:
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
### Database
  TemplateApp API uses PostgreSQL. After setting up your PostgreSQL user, create and migrate the database with:
  ```
  rails db:create
  rails db:migrate
  ```
### Test suite
  To run the test suite, simply run `rspec`.

### Git Hooks
  Install optional Git hooks with `rusky install` (uninstallation is done with `rusky uninstall`).
  
  Rules are the following:
  -  Pre-commit: Rubocop all modified files
  -  Pre-push: RSpec suite runs for all staged files and all modified files of the branch

### Deployment
  To deploy to Heroku
  `bundle exec rake deploy:staging`
  `bundle exec rake deploy:development`
  `bundle exec rake deploy:production`

