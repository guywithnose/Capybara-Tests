require_relative 'settings'

Given /^I am on the "([^"]*)" advanced search page$/ do |realm|
  Capybara.run_server = false
  visit('http://' + Settings.environment + '.' + realm + '.com/advanced-search/')
end

When /^I choose "([^"]*)" class$/ do |className|
  find("input[type='radio'][name='type'][text='" + className + "']").click
end

When /^I open the "([^"]*)" section$/ do |section|
  parent = find(:xpath, '//*[@id="'+section+'"]/..')
  if parent[:class].include?('moduleBox')
    parent.click
  else
    parent.find(:xpath, './..').click
  end  
end

When /^I click the "([^"]*)" checkbox$/ do |checkboxName|
  checkBoxXpath = '//div[@class="openFacet"]/span[contains(., "'+checkboxName+'")]/preceding-sibling::input[1]'
  page.should have_xpath(checkBoxXpath)
  find(:xpath, checkBoxXpath).click
end

When /^I click search$/ do
  click_link('advancedSearchBtn')
end

Then /^My search should include "([^=]*)=([^"]*)"$/ do |param, value|
  breadBoxXpath = '//a[@class="removeIcon"][@title="'+param+'"]/strong'
  page.should have_xpath(breadBoxXpath)
  find(:xpath, breadBoxXpath).text.should eql(value)
end

When /^I set (\w+) range to ([\w\$]+)\-([\w\$]+)$/ do |param, low, high|
  select(low, :from => param+'Begin')
  select(high, :from => param+'End')
end

When /^I enter "(.*?)" into "(.*?)"$/ do |text, textBox|
  fill_in textBox, :with => text
end
