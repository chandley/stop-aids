Feature: 
  In order to become more engaged with politics
  As a curious student
  And I should be able to ask a question


  Scenario: See list of questions
    Given that the app knows where I am
    When I visit the site
    Then I should see a list of available questions

  Scenario: A candidate is preselected 
    Given that the app knows where I am
    When I visit the site
    Then then I should see a default candidate

  Scenario: I select a question
    Given that I am on the homepage
    When I select a question
    Then the question should selected status


  Scenario: When I submit questions I am invited to log in
    Given I have selected a question
    When I click the submit button
    Then I am invited to log in


  Scenario: Question submitted after login
    Given I have submitted a question
    When I log in successfully
    Then my questions are confirmed as submitted