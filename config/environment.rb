# Load the Rails application.
require File.expand_path('../application', __FILE__)


# Initialize the Rails application.
WIMS::Application.initialize!
  #config.frameworks -= [:active_record]
  