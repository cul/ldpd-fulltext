source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.4'
gem 'webpacker', '~> 5.4'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'nokogiri', '~> 1.10.10'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'
group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
end
group :development, :test do
  gem 'capistrano', '~> 3.11', require: false
  gem 'capistrano-cul', require: false
  gem 'capistrano-passenger', '~> 0.1', require: false
  gem 'capistrano-rails', '~> 1.4', require: false
  gem 'capistrano-rvm', '~> 0.1', require: false
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.4'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  gem "jettywrapper", ">= 2.0"
  gem "solr_wrapper"

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
group :fulltext_dev, :fulltext_test, :fulltext_prod do
  # Use mysql2 gem for mysql connections in deployed apps
  gem 'mysql2', '~> 0.5'
end

gem 'blacklight', '~> 7.0'
gem 'logger', '1.2.8.1'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]
gem 'rsolr', '~> 1.0.6'
gem 'devise', '~> 4.7'
gem 'devise-guests'
