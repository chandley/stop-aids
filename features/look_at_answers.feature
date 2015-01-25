Feature: 
  In order to find out about my candidates
  As a student a little interested in politcs
  I want to look at existing answers to questions

  Scenario: API gives answers
  Given we have some questions for a candidate
  When answers are given for a question by API
  Then we see the answered question
