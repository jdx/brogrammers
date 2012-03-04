Feature: Authentication
  In order to learn about brogramming
  As a future brogrammer
  I should be able to apply, login and logout

  Scenario: Visiting the home page
    Given I am on the homepage
    Then I should see a link to register

  Scenario: Applying
    Given I am on the homepage
    And I follow "Apply"
    When I fill out the registration form as brogrammer "dickeyxxx"
    Then I should see "We got your application"
    And there should be the brogrammer "dickeyxxx" in the system

  Scenario: Logging in
    Given I am on the homepage
    And I follow "Login"
    And there is a brogrammer "dickeyxxx"
    When I fill out the login form as brogrammer "dickeyxxx"
    Then I should be logged in as "dickeyxxx"

  Scenario: Logging out
    Given I am logged in as "dickeyxxx"
    And I am on the homepage
    When I follow "Logout"
    Then I should not be logged in
