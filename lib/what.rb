Mime::Type.class_eval do
  
  Mime::SET.each do |each|
    define_method "#{each.to_sym}?" do
      to_sym == each.to_sym
    end
  end

end

