require "rspec/rails"
require 'capybara/rspec'
require 'database_cleaner'
require 'vcr'

DatabaseCleaner[:active_record].strategy = :truncation
RSpec.configure do |config|
	config.before(:all) do
		DatabaseCleaner.clean
	end

	config.after(:each) do
		DatabaseCleaner.clean
	end
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end 

VCR.configure do |config|
 	config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
 	config.hook_into :webmock
end

