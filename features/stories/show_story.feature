Feature: Show Story

Background:
Given I am user "user@email.com" with password "foobar"
And I visit "/users/sign_in"
And I fill in "Email" with "user@email.com"
And I fill in "Password" with "foobar"
And I click "Sign in"

Scenario: Story show if text no url

Given I have a course named "Foo" with "A Foo Bar Story"
And I visit "/latest"
When I click link "Foo"
Then I should see "A Foo Bar Story"
