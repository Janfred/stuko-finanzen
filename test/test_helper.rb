ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
if ENV['CODACY_PROJECT_TOKEN'] then
  require 'codacy-coverage'
  Codacy::Reporter.start
end
SimpleCov.start
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
