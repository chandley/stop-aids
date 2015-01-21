Feature: 
  In order to share data nicely
  As an api server
  I want to give good responses to api requests

  Scenario: Show candidate api
  Given we have a candidate
  When I visit the candidate api
  Then I get JSON candidate name

  Scenario: Show candidate question api
  Given we have a candidate
  And we have some questions
  When I visit the candidate questions api
  Then I get JSON question text

  Scenario: Show constituency api
  Given we have a constituency
  When I visit the constituency api
  Then I get JSON constituency name 

  Scenario: Show constituency candidates api
  Given we have a constituency
  And we have some candidates
  When I visit the constituency candidates api
  Then I get JSON candidate names for constituency 

  Scenario: Show unanswered questions api
  Given we have some questions for a candidate
  And I answer a question
  When I visit the unanswered candidate questions api
  Then I get JSON unanswered questions only

  Scenario: Show a random question
  Given we have some questions for a candidate
  When I visit the random unanswered question api
  Then I get JSON one unanswered question
