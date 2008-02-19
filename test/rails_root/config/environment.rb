# Specifies gem version of Rails to use when vendor/rails is not present
old_verbose, $VERBOSE = $VERBOSE, nil
RAILS_GEM_VERSION = '2.0.2'
$VERBOSE = old_verbose
 
require File.join(File.dirname(__FILE__), 'boot')
 
Rails::Initializer.run do |config|
  config.log_level = :debug
  config.cache_classes = false
  config.whiny_nils = true
end
