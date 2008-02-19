require File.join(File.dirname(__FILE__), 'lib', 'what.rb')

ActionController::Base.send :include, What
