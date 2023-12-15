source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 7.0.6'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use terser as compressor for JavaScript assets
gem 'terser'

gem "sassc-rails", "~> 2.1"

gem "bootstrap", "~> 5.1"
gem "font-awesome-sass", "~> 6.4.0"

# Use Puma as the app server
gem 'puma', '~> 5.2'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

gem 'nokogiri', '~> 1.15.2' # update past 1.10 requires alma
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'
group :development do
  gem 'listen'
end
group :development, :test do
  gem 'capistrano', '~> 3.17.3', require: false
  gem 'capistrano-rails', '~> 1.4', require: false
  gem 'capistrano-bundler', '~> 1.1', require: false
  gem 'capistrano-rvm', '~> 0.1', require: false
  gem 'capistrano-passenger', '~> 0.2', require: false
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.4'

  gem "jettywrapper", ">= 2.0"
  gem "solr_wrapper"

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
group :fulltext_dev, :fulltext_test, :fulltext_prod do
  # Use mysql2 gem for mysql connections in deployed apps
  gem 'mysql2', '~> 0.5'
end

gem 'blacklight', '~> 8.1'
gem 'logger', '1.2.8.1'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]
gem 'rsolr'
gem 'devise', '~> 4.7'
gem 'devise-guests'
