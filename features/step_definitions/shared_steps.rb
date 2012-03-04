Given /^I am on the homepage$/ do
  visit "/"
end

When /^I follow "([^"]*)"$/ do |text|
  click_link text
end

Then /^I should not see "([^"]*)"$/ do |text|
  page.should_not have_content(text)
end

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content(text)
end
