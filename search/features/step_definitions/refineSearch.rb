#This allows the page to load even if an ad is return an http 500
def adWrapper(code)
  eval(code)
rescue Capybara::Driver::Webkit::WebkitInvalidResponseError
end

Given /^I am on a (\w+) nationwide search with no criteria\.$/ do |realm|
  adWrapper "visit('http://" + Settings.environment + '.' + realm + ".com/search-results')"
end

When /^I click the "(.*?)" refine link$/ do |linkText|
  adWrapper "click_link('" + linkText + "')"
end

Then /^The page should contain "(.*?)"$/ do |text|
    adWrapper "page.should have_content('" + text + "')"
end
