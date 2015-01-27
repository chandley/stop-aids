

Given(/^we have a candidate$/) do
  @alice = Candidate.create(name: 'Alice')
end

Given(/^we have some candidates$/) do
  Candidate.create(name: 'Bob', constituency_id: @constituency.id)
  Candidate.create(name: 'Alice', constituency_id: @constituency.id)
end

Given(/^we have some questions with choices$/) do
  @red_or_blue = Question.create(ask_text: 'Would you rather red pill or blue pill?')
  @red = Choice.create(text: 'Red', question_id: @red_or_blue.id)
  @blue = Choice.create(text: 'Blue', question_id: @red_or_blue.id)
  @war_or_famine = Question.create(ask_text: 'Would you rather war or famine?')
  @war = Choice.create(text: 'War', question_id: @war_or_famine.id)
  @famine = Choice.create(text: 'Famine', question_id: @war_or_famine.id)
  @beef_or_chicken = Question.create(ask_text: 'Would you rather beef or chicken?')
  @beef = Choice.create(text: 'Beef', question_id: @beef_or_chicken.id)
  @chicken = Choice.create(text: 'Chicken', question_id: @beef_or_chicken.id)
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


Then(/^I see the choices for each question$/) do
  expect(page).to have_content 'Red'
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

Given(/^we have some questions with choices for a candidate$/) do
  step('we have some questions with choices')
  step('we have a candidate')
end

Given(/^I answer a question$/) do
  @red_or_blue.create_answer(@alice, @blue)
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
  post "candidates/#{@alice.id}/answers", 
                    :question_id => @red_or_blue.id, 
                    :choice_id => @red.id
                  
end

Then(/^we see the answered question$/) do
  visit "/candidates/#{@alice.id}/questions/answered"
  expect(page).to have_content('red pill or blue')
end

When(/^a student submits an ask question$/) do
  @student = User.create(email: 'test@test.com', password: 'password', password_confirmation: 'password')
  post "/users/#{@student.id}/candidates/#{@alice.id}/asks", :question_id => @red_or_blue.id
end

When(/^a student submits an ask question with JSON callback$/) do
  @student = User.create(email: 'test@test.com', password: 'password', password_confirmation: 'password')
  post "/users/#{@student.id}/candidates/#{@alice.id}/asks?callback=JSON_CALLBACK", :question_id => @red_or_blue.id
end

Then(/^we see the question on an asked question list$/) do
  visit("/users/#{@student.id}/candidates/#{@alice.id}/asks")
  expect(page).to have_content("red pill or blue")
end

When(/^a student submits two asks$/) do
  step('a student submits an ask question')
  post "/users/#{@student.id}/candidates/#{@alice.id}/asks", :question_id => @war_or_famine.id
end

Then(/^we see both on an asked questions list$/) do
  step('we see the question on an asked question list')
  expect(page).to have_content("famine")
end

#When(/^the administrator adds a question by api$/) do
  # page.driver.post("/questions",
  #                 :ask_text => "do you like pizza or kebabs",  
  #                 )
#end

#Then(/^I get JSON kebab question text$/) do
  # expect(page).to have_content("pizza or kebabs")
#end

