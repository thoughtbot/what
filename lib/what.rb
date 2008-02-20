Mime::Type.class_eval do
  
  Mime::SET.each do |mime_type|
    define_method "#{mime_type.to_sym}?" do
      to_sym == mime_type.to_sym
    end
  end

end

