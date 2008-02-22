require File.join(File.dirname(__FILE__), 'test_helper')

class WhatTest < Test::Unit::TestCase
  
  def setup
    Mime::Type.register 'image/gif', :gif
    Mime::Type.register 'text/iphone', :iphone
    Mime::Type.register 'text/x-mobile', :mobile
    Mime::Type.register 'application/pdf', :pdf
    Mime::Type.register 'image/png', :png
  end

  Mime::SET.each do |mime_type|
    define_method "test_should_say_its_a_#{mime_type.to_sym}_mime_type_when_sent_#{mime_type.to_sym}?" do
      assert mime_type.send("#{mime_type.to_sym}?")
    end

    other_mime_type = Mime::SET.detect {|each| each != mime_type}
    define_method "test_should_not_say_its_a_#{other_mime_type.to_sym}_mime_type_if_its_not_one_when_sent_#{other_mime_type.to_sym}?" do
      assert ! mime_type.send("#{other_mime_type.to_sym}?")
    end
  end

end
