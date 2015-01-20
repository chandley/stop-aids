Feature: 
  In order to share data nicely
  As an api server
  I want to give good responses to api requests

  Scenario: Show candidate api
  Given we have a candidate
  When I visit the candidate api address
  Then I get JSON candidates name

  Scenario: Show candidate question api
  Given we have a candidate
  And we have some questions
  When I visit the candidate questions api address
  Then I get JSON question data

  Scenario: Show constituency api
  Given we have a constituency
  When I visit the constituency api
  Then I get JSON constituency name data

  Scenario: Show constituency candidates api
  Given we have a constituency
  And we have some candidates
  When I visit the constituency candidates api
  Then I get JSON candidates for constituency data
