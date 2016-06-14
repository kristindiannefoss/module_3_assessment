require 'simplecov'
SimpleCov.start("rails")
require 'database_cleaner'
require 'shoulda-matchers'
require 'capybara'
require 'capybara/rspec'
require 'launchy'
require 'pry'


RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

end
