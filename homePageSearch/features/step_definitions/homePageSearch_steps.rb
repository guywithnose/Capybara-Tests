environment = 'php5dev'

Given /^I am on the "([^"]*)" home page$/ do |realm|
  Capybara.run_server = false
  visit('http://' + environment + '.' + realm + '.com')
end

When /^I select "(.*?)" make$/ do |make|
  select(make, :from => 'make')
end

When /^I click search$/ do
  find(:xpath, '//input[@value="SEARCH"]').click
end

Then /^My search should include "([^=]*)=([^"]*)"$/ do |param, value|
  breadBoxXpath = '//a[@class="removeIcon"][@title="'+param+'"]/strong'
  page.should have_xpath(breadBoxXpath)
  find(:xpath, breadBoxXpath).text.should eql(value)
end
