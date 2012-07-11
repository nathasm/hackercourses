Given /^I am on the home page$/ do
    visit '/'
end

Then /^I should see "(.*?)"$/ do |arg1|
    page.should have_content(arg1)
end

Given /^I visit "(.*?)"$/ do |url|
    visit url
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |field, value|
    fill_in field, with: value
end

When /^I click "(.*?)"$/ do |text|
    click_button text
end

When /^I click link "(.*?)"$/ do |text|
    click_link text
end

Then /^I should not see "(.*?)"$/ do |arg1|
  page.should_not have_content(arg1)
end
