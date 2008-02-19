require File.dirname(__FILE__) + '/test_helper'

class WhatController < ActionController::Base

  def index
    redirect_to_new if csv?
  end
  
  def new
  end
  
  protected
  
  def redirect_to_new
    redirect_to new_what_url
  end

end

WhatController.view_paths = [ File.dirname(__FILE__) + "/fixtures/" ]

class WhatControllerTest < Test::Unit::TestCase
  def setup
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @controller = WhatController.new
    @request.host = "www.example.com"
  end

  def test_html
    @request.env["HTTP_ACCEPT"] = 'text/html'
    get :index
    assert_equal 'The what#index HTML formatted view.', @response.body
  end
  
  def test_csv
    @request.env["HTTP_ACCEPT"] = 'text/csv'
    get :index
    assert_redirected_to new_what_url
  end
end
