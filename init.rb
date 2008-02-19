require File.join(File.dirname(__FILE__), 'lib', 'what')

ActionController::Base.send :include, What
