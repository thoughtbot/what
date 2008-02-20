require File.join(File.dirname(__FILE__), 'test_helper')

class WhatTest < Test::Unit::TestCase
  
  def setup
    Mime::Type.register 'image/gif', :gif
    Mime::Type.register 'text/iphone', :iphone
    Mime::Type.register 'text/x-mobile', :mobile
    Mime::Type.register 'application/pdf', :pdf
    Mime::Type.register 'image/png', :png
  end

  Mime::SET.each do |each|
    define_method "test_should_say_its_a_#{each.to_sym}_mime_type_when_sent_#{each.to_sym}?" do
      assert each.send("#{each.to_sym}?")
    end
  end

end
