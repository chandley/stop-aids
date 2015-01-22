

Given(/^we have a candidate$/) do
  @alice = Candidate.create(name: 'Alice')
end

Given(/^we have some candidates$/) do
  Candidate.create(name: 'Alice')
  Candidate.create(name: 'Bob')
end

Given(/^we have some questions$/) do
  @red_or_blue = Question.create(ask_text: 'Would you rather red pill or blue pill?')
  @war_or_famine = Question.create(ask_text: 'Would you rather war or famine?')
  Question.create(ask_text: 'Would you rather beef or chicken?')
end

Given(/^we have a constituency$/) do
  @constituency = Constituency.create(name: 'Bethnal Green and Bow')
end

When(/^I visit the candidate api$/) do
  visit "/candidates/#{@alice.id}"
end

When(/^I visit the candidate questions api$/) do
  visit "/candidates/#{@alice.id}/questions"
end

When(/^I visit the constituency api$/) do
  visit "/constituencies/#{@constituency.id}"
end

When(/^I visit the constituency candidates api$/) do
  visit "/constituencies/#{@constituency.id}/candidates"
end

Then(/^I get JSON candidate name$/) do
  expect(page).to have_content 'Alice'
end

Then(/^I get JSON question text$/) do
  expect(page).to have_content 'beef or chicken'
end

Then(/^I get JSON constituency name$/) do
  expect(page).to have_content 'Bethnal Green'
end 

Then(/^I get JSON candidate names for constituency$/) do
  expect(page).to have_content 'Bob'
end

Given(/^we have some questions for a candidate$/) do
  step('we have some questions')
  step('we have a candidate')
end

Given(/^I answer a question$/) do
  @red_or_blue.create_answer(@alice,'whatever')
end

When(/^I visit the unanswered candidate questions api$/) do
  visit "/candidates/#{@alice.id}/questions/unanswered"
end

Then(/^I get JSON unanswered questions only$/) do
  expect(page).to_not have_content('red pill')
end

When(/^I visit the random unanswered question api$/) do
  visit "/candidates/#{@alice.id}/questions/random_unanswered"
end

Then(/^I get JSON one unanswered question$/) do
  expect(page).to have_content(/pill|famine|chicken/)
end

When(/^answers are given for a question by API$/) do
  # http://suffix.be/blog/capybara-post-requests
  # this does not appear to be working!
  page.driver.post("candidates/#{@alice.id}/answers", 
                    :question_id => @red_or_blue.id, 
                    :answer_text => 'whatever' 
                     )
end

Then(/^we see the answered question$/) do
  visit "/candidates/#{@alice.id}/questions/answered"
  expect(page).to have_content('red pill or blue')
end

When(/^a student submits an ask question$/) do
  @student = User.create(email: 'test@test.com', password: 'password', password_confirmation: 'password')
  page.driver.post("/users/#{@student.id}/candidates/#{@alice.id}/asks",
                    :question_id => @red_or_blue.id,  
                    )

end

Then(/^we see the question on an asked question list$/) do
  visit("/users/#{@student.id}/candidates/#{@alice.id}/asks")
  expect(page).to have_content("red pill or blue")
end

When(/^a student submits two asks$/) do
  step('a student submits an ask question')
  page.driver.post("/users/#{@student.id}/candidates/#{@alice.id}/asks",
                    :question_id => @war_or_famine.id,  
                    )
end

Then(/^we see both on an asked questions list$/) do
  step('we see the question on an asked question list')
  expect(page).to have_content("famine")
end

