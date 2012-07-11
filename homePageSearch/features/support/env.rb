require "capybara"
require "capybara/cucumber"
require "capybara/webkit"


Capybara.run_server = false
Capybara.default_driver = :webkit
Capybara.current_driver = :webkit
#Capybara.javascript_driver = :webkit
Capybara.app_host = 'http://php5dev.cycletrader.com'
Capybara.default_wait_time = 15

Capybara.register_driver :webkit do |app|
  Capybara::Driver::Webkit.new(app, :stdout => nil)
end 
