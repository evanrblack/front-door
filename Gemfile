source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster.
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# ADDED
# BACKEND
# For login and authentication
gem 'devise'
# For geocoding stuff
gem 'geocoder'
# For phone validation and normalization
gem 'phony_rails'
# For handling file uploads
gem 'carrierwave'
# For handling roles and capabilities
gem 'cancancan'
# For handling image processing
gem 'mini_magick'

# FRONTEND
# For marking up pages
gem 'haml-rails'
# For easy page styling
gem 'bootstrap-sass'
# For great icons
gem 'font-awesome-rails'
# For better forms
gem 'simple_form'

# MISC
# For coming up with random stuff
gem 'faker'
# For queues and workers
gem 'resque'
# For scheduling work
gem 'resque-scheduler'

# DEPLOYMENT
group :development do
  # Capistrano, Bundler tasks, and Rails tasks
  gem 'capistrano-rails'
  # For using RVM for task execution
  gem 'capistrano-rvm'
  # For managing server
  gem 'capistrano3-puma'
end
# For managing env variables
gem 'dotenv-rails'

# CODE QUALITY
gem 'rubocop', require: false, group: :development

# BETTER REPL
gem 'pry-rails', group: :development

# TESTING
group :test do
  # Do feature testing through a browser
  # (minitest, minitest-rails, minitest-capybara, and capybara)
  gem 'minitest-rails-capybara'
  # Allows capybara to talk to PhantomJS
  gem 'poltergeist'
  # Pretty test output
  gem 'minitest-reporters'
  # Easy stubbing to a block
  gem 'minitest-stub-const'
end
