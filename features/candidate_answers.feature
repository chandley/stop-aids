Feature:
  As a candidate 
  In order to get student votes
  I want to answer their questions

  Scenario: Candidate alerted to questions on own page
    Given we have asked questions for a candidate
    When number of asks reaches a certain threshold 
    Then I get an alert on my twitter feed

  Scenario: Not answered a question before

  Scenario: Candidate accesses questions page
    Given I have been alerted to pending questions on twitter
    When I click on the link in the tweet
    Then I get taken to the questions list

  Scenario: Candidate sees questions ranked by times asked
    Given we have asked questions for a candidate
    When I visit the candidate questions api
    Then I see the number of times each question has been asked

  Scenario: Candidate sees choices for questions
    Given we have asked questions for a candidate
    When I visit the candidate questions api
    Then I see the available choices for each question

  