if ENV['RSPEC_WATCHER']
  # avoid running watched tests in a new container everytime
  # and fallback to normal db
  ENV['USE_TEST_CONTAINERS'] = 'false'

  RSpecWatcher.configure do
    watch 'spec', only: /_spec\.rb\z/ do |modified, added, _removed|
      modified + added
    end

    watch 'spec', ignore: /_spec\.rb\z|examples.txt\z/

    watch 'app', only: /\.rb\z/, ignore: %r{controllers/} do |modified, added, removed|
      (modified + added + removed).map do |path|
        path.sub('/app/', '/spec/').sub('.rb', '_spec.rb')
      end
    end

    watch 'app/controllers', only: /\.rb\z/ do |modified, added, removed|
      (modified + added + removed).map do |path|
        path.sub('/app/', '/spec/').sub('/controllers/', '/requests/').sub('_controller.rb', '_spec.rb')
      end
    end

    watch 'config', only: /routes\.rb\z/
  end
end
