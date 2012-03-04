require 'rubygems'
require 'spork'

Spork.prefork do
  require 'cucumber/rails'
  Capybara.default_selector = :css
  ActionController::Base.allow_rescue = false
  DatabaseCleaner.strategy = :transaction
  Cucumber::Rails::Database.javascript_strategy = :truncation
  load_schema = lambda {
    load "#{Rails.root.to_s}/db/schema.rb" 
  }
  silence_stream(STDOUT, &load_schema) 
end

Spork.each_run do
end
