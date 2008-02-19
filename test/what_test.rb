require File.dirname(__FILE__) + '/test_helper'
require File.dirname(__FILE__) + '/fixtures/what_controller'

class WhatControllerTest < Test::Unit::TestCase
  
  def setup
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @controller = WhatController.new
    ActionController::Routing::Routes.draw do |map|
      map.connect 'what', :controller => 'what'
      map.connect 'what/new', :controller => 'what', 
        :action => 'new'
    end
  end

  def test_html
    @request.env["HTTP_ACCEPT"] = 'text/html'
    get :index
    assert_equal 'The what#index HTML formatted view.', @response.body
  end
  
  def test_csv
    @request.env["HTTP_ACCEPT"] = 'text/csv'
    get :index
    assert_redirected_to :action => :new
  end
  
  # def test_new_convenience_methods
  #   types = [:gif, :iphone, :mobile, :pdf, :png]
  #   types.each do |type|
  #     assert @controller.send("#{type}?"), "ActionController::Base does not have a #{type}? instance method"
  #   end
  # end
end
