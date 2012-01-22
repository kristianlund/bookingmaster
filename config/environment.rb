# Load the rails application
require File.expand_path('../application', __FILE__)

Haml::Template.options[:encoding] = "utf-8"

# Initialize the rails application
Bookingmaster::Application.initialize!
