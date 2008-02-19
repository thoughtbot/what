class WhatController < ActionController::Base

  def index
    redirect_to :action => :new and return if csv?
    render :text => 'The what#index HTML formatted view.'
  end
  
  def new
    render :text => 'The what#new HTML formatted view.'
  end

end

