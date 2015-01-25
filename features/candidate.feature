Feature: 
  In order to find how my vote counts
  As a student a little interested in politcs
  I want to find which candidates are in my consituency

  Scenario: Show candidate details
  Given we have a candidate
  When I visit the candidate api
  Then I get JSON candidate name

  Scenario: Show constituency details
  Given we have a constituency
  When I visit the constituency api
  Then I get JSON constituency name 

  Scenario: Show which candidates are in a constituency
  Given we have a constituency
  And we have some candidates
  When I visit the constituency candidates api
  Then I get JSON candidate names for constituency

  
 
  

