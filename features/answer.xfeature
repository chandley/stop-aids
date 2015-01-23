Feature:
  In order to compare candidates
  As a student voter
  I want to see clear analysis of answers

  Scenario: Show table comparing candidates answer of a question
  Given several candidates have answered a question
  When I visit the question analytics page
  Then I see a table of candidate responses

  Scenario: Choose one of two answers
  Given we have some questions with two possible answers
  When I choose an answer and submit
  Then I get a confirmation my answer is accepted

  Scenario: Choose forbidden answer
  Given we have some questions with two possible answers
  When I choose a forbidden answer
  Then I get an 'invalid answer' error