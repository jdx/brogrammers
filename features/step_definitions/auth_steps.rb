Given /^I am logged in$/ do
  Given 'I am logged in as "dickeyxxx"'
end

Given /^I am logged in as "([^"]*)"$/ do |handle|
  Factory(:brogrammer, handle: handle, password: 'password')
  visit "/login"
  fill_in 'brogrammer_handle', with: 'dickeyxxx'
  fill_in 'brogrammer_password', with: 'password'
  click_button 'Login'
end

Given /^there is a brogrammer "([^"]*)"$/ do |handle|
  Factory(:brogrammer, handle: handle)
end

Given /^I am on the registration page$/ do
  visit '/apply'
end

When /^I fill out the registration form as brogrammer "([^"]*)"$/ do |handle|
  fill_in 'brogrammer_handle', with: handle
  fill_in 'brogrammer_email', with: 'jeff@dickey.xxx'
  fill_in 'brogrammer_password', with: 'password'
  click_button 'Do work'
end

When /^I fill out the login form as brogrammer "([^"]*)"$/ do |handle|
  fill_in 'brogrammer_handle', with: handle
  fill_in 'brogrammer_password', with: 'password'
  click_button 'Login'
end

Then /^there should be the brogrammer "([^"]*)" in the system$/ do |handle|
  Brogrammer.where(handle: handle).any?.should be_true
end

Then /^I should see a link to register$/ do
  find 'a[href="/apply"]'
end

Then /^I should be logged in as "([^"]*)"$/ do |handle|
  page.should have_content "Logout"
  page.should_not have_content "Login"
  page.should_not have_content "Apply"
  page.should have_content handle
end

Then /^I should not be logged in$/ do
  page.should have_content "Login"
  page.should have_content "Apply"
  page.should_not have_content "Logout"
end
