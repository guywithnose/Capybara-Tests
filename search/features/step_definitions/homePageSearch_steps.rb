require_relative 'settings'

Given /^I am on the "([^"]*)" home page$/ do |realm|
  visit('http://' + Settings.environment + '.' + realm + '.com')
end

When /^I select "(.*?)" make$/ do |make|
  select(make, :from => 'make')
end

When /^I click the search button$/ do
  find(:xpath, '//input[@value="SEARCH"]').click
end

Then /^The search should include "([^"]*)"$/ do |value|
  breadBoxXpath = '//a[@class="removeIcon"]/strong[contains(., "'+value+'")]'
  page.should have_xpath(breadBoxXpath)
end
