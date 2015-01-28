Feature: 
  In order to learn about my candidate
  As an student interested in politics
  I want to look at available questions

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

  Scenario: Student sees candidate answered questions only
  Given we have some questions with choices for some candidates
  When all the questions are answered for the first candidate
  And I visit the unanswered candidate questions api
  Then I see no questions for the candidate
