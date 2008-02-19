module What
  module ActionControllerHook
    
    # Mime::Type.register 'image/gif', :gif
    # Mime::Type.register 'text/iphone', :iphone
    # Mime::Type.register 'text/x-mobile', :mobile
    # Mime::Type.register 'application/pdf', :pdf
    # Mime::Type.register 'image/png', :png
        
    Mime::SET.each do |mime_type|
      define_method "#{mime_type.to_sym}?" do
        request.format == mime_type
      end
    end
    
  end
end

