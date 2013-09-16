require 'capybara/rspec'
require 'simplecov'
require 'database_cleaner'
SimpleCov.start 'rails'

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

driver = ENV['DEFAULT_DRIVER'] || 'webkit'

Capybara.javascript_driver = driver.to_sym

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

DatabaseCleaner.strategy = :truncation

DatabaseCleaner.clean

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
end
