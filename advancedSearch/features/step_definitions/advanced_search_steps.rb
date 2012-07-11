environment = 'php5dev'

Given /^I am on the "([^"]*)" advanced search page$/ do |realm|
  Capybara.run_server = false
  visit('http://' + environment + '.' + realm + '.com/advanced-search/')
end

When /^I choose "([^"]*)" class$/ do |className|
  hrefBefore = find('#advancedSearchBtn')[:href]
  find("input[type='radio'][name='type'][text='" + className + "']").click
  #Wait for the ajax to return
  page.wait_until{find('#advancedSearchBtn')[:href] != hrefBefore}
end

When /^I open the "([^"]*)" section$/ do |section|
  find(:xpath, '//*[@id="'+section+'"]/..').click
end

When /^I click the "([^"]*)" checkbox$/ do |checkboxName|
  hrefBefore = find('#advancedSearchBtn')[:href]
  checkBoxXpath = '//div[@id="condition"]/span[contains(., "'+checkboxName+'")]/preceding-sibling::input'
  page.should have_xpath(checkBoxXpath)
  find(:xpath, checkBoxXpath).click
  #Wait for the ajax to return
  page.wait_until{find('#advancedSearchBtn')[:href] != hrefBefore}
end

When /^I click search$/ do
  click_link('advancedSearchBtn')
end

Then /^My search should include "([^=]*)=([^"]*)"$/ do |param, value|
  breadBoxXpath = '//a[@class="removeIcon"][@title="'+param+'"]/strong'
  page.should have_xpath(breadBoxXpath)
  find(:xpath, breadBoxXpath).text.should eql(value)
end
