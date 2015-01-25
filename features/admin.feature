Feature: 
  In order to have an app which is useful to users
  As an administrator
  I want to be able to update data

Scenario: Administrator adds question
  Given we have a candidate
  When the administrator adds a question by api
  And I visit the candidate questions api
  Then I get JSON kebab question text

