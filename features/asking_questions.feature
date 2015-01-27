Feature: 
  In order to get my candidate to answer important questions
  As an student interested in politics
  I want to ask questions with other students

  Scenario: Student sees a question
  Given we have a candidate
  And we have some questions with choices
  When I visit the candidate questions api
  Then I get JSON question text

  Scenario: Student sees available answers for question
  Given we have a candidate
  And we have some questions with choices
  When I visit the candidate questions api
  Then I see the choices for each question

  Scenario: Student sees unanswered questions only
  Given we have some questions with choices for a candidate
  And I answer a question
  When I visit the unanswered candidate questions api
  Then I get JSON unanswered questions only

  Scenario: Student sees a random question
  Given we have some questions with choices for a candidate
  When I visit the random unanswered question api
  Then I get JSON one unanswered question

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
