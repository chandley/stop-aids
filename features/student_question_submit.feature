Feature: 
  In order to get my candidate to answer important questions
  As an student interested in politics
  I want to ask questions with other students

Scenario: Student registers
  Given there are no users
  When I submit my details
  Then I am registered as a user

Scenario: Student submits a question
  Given we have some questions with choices for a candidate
  When a student submits an ask question
  Then we see the question on an asked question list

  Scenario: Student submits a question with JS callback
  Given we have some questions with choices for a candidate
  When a student submits an ask question with JSON callback
  Then we see the question on an asked question list

  Scenario: Student submits two questions
  Given we have some questions with choices for a candidate
  When a student submits two asks
  Then we see both on an asked questions list