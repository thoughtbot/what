class WhatController < ActionController::Base

  def index
    if csv?
      redirect_to :action => :new 
    else
      render :text => 'The what#index HTML formatted view.'
    end
  end
  
  def new
    render :text => 'The what#new HTML formatted view.'
  end

end

