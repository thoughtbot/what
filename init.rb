require File.dirname(__FILE__) + '/lib/what.rb'
ActionController::Base.send :include, What::ActionControllerHook