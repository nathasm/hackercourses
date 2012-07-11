 Feature: List Courses by latest

 Scenario: Happy Path should list courses

 Given I have a course named "Ruby on Rails 101" 
 And I have a course named "NodeJs 101" 
 And I have a course named "JQuery 101" 
 When I visit "/latest"
 Then I should see "Ruby on Rails 101"
 And I should see "NodeJs 101"
 And I should see "JQuery 101"
