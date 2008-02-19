# Load the environment
ENV['RAILS_ENV'] = 'sqlite3'

rails_root = File.dirname(__FILE__) + '/rails_root'

require "#{rails_root}/config/environment.rb"
 
# Load the testing framework
require 'test_help'
silence_warnings { RAILS_ENV = ENV['RAILS_ENV'] }

require File.join(File.dirname(__FILE__), '..', 'init')
