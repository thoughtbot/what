module What
  module ActionControllerHook
    
    Mime::SET.each do |mime_type|
      define_method "#{mime_type.to_sym}?" do
        request.format == mime_type
      end
    end
    
  end
end

