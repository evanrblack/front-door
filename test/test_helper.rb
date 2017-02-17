ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

# Enable minitest
require 'minitest/rails'
require 'minitest/rails/capybara'

# For javascript testing
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

# For nicer reports
require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

module ActiveSupport
  class TestCase
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end

# Enable Devise helpers
module ActionDispatch
  class IntegrationTest
    include Devise::Test::IntegrationHelpers
  end
end
