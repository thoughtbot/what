require File.join(File.dirname(__FILE__), 'test_helper')

class WhatTest < Test::Unit::TestCase
  
  def setup
    Mime::Type.register 'image/gif', :gif
    Mime::Type.register 'text/iphone', :iphone
    Mime::Type.register 'text/x-mobile', :mobile
    Mime::Type.register 'application/pdf', :pdf
    Mime::Type.register 'image/png', :png
  end

  Mime::SET.each do |type|
    define_method "test_new_#{type.to_sym}?_convenience_method" do
      assert type.send("#{type.to_sym}?")
    end
  end

end
