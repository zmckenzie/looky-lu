require 'simplecov'
require 'coveralls'
Coveralls.wear!('rails')
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start do
  add_filter "/spec/"
end

ENV["RAILS_ENV"] = 'test'

require 'active_record'
require 'database_cleaner'
require 'rails'
require 'rails/all'
require 'rails/generators'
require "rails/test_help"

if ENV['RCOV'] == 'true'
  require 'simplecov-rcov'
  SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.clean

  end

  def database_config
    YAML.load_file("spec/support/database.yml")[ENV['RAILS_ENV']]
  end

  def connect_to_db
    ActiveRecord::Base.establish_connection database_config
  end

  def load_db
    load 'spec/support/schema.rb'
  end

end

connect_to_db
load_db

