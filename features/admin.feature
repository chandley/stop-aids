Feature: 
  In order to have an app which is useful to users
  As an administrator
  I want to be able to update data

Scenario: Administrator adds question
  Given we have a candidate
  When the administrator adds a question by api
  And I visit the candidate questions api
  Then I get JSON kebab question text

Scenario: Administrator deletes question
  Given we have some questions for a candidate
  When the administrator deletes first question by api
  And I visit the candidate questions api
  Then I don't see the first question


Scenario: Administrator edits candidate name
  Given we have a candidate
  When the administrator edits candidate name 
  Then we see the updated information for candidate

Scenario: Administrator edits candidate twitter
  Given we have a candidate
  When the administrator adds candidate twitter
  Then we see the twitter information for candidate

Scenario: Administrator adds a new candidate
  Given we have a constituency
  When the administrator adds a candidate 
  And I visit the constituency candidates api
  Then I get JSON candidate names for constituency 

Scenario: Administrator deletes a candidate
  Given we have a candidate in a constituency
  When the administrator deletes the candidate
  Then we don't see the candidate in candidate data view


