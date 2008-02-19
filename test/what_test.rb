require File.join(File.dirname(__FILE__), 'test_helper')
require File.join(File.dirname(__FILE__), 'fixtures', 'what_controller')

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

  types = [:gif, :pdf, :iphone, :mobile, :pdf, :png]
  types.each do |type|
    define_method "test_new_#{type}?_convenience_method" do
      get :index, :format => type.to_s

      assert @controller.send("#{type}?"), type
    end
  end

end
