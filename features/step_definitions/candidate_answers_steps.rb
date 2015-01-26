Given(/^lots of students have asked a question$/) do
  step('we have some questions for a candidates')
  @adrian = User.create(email: 'adrian@uu.com', password:'password', password_confirmation:'password')
  @ben = User.create(email: 'ben@uu.com', password:'password', password_confirmation:'password')
  @ben_asks_alice_redblue = Ask.create(user_id: @ben.id, question_id: @red_or_blue.id, candidate_id: @alice.id)
  @adrian_asks_alice_redblue = Ask.create(user_id: @adrian.id, question_id: @red_or_blue.id, candidate_id: @alice.id)
end

When(/^number of asks reaches a certain threshold$/) do
  # express the regexp above with the code you wish you had
end

Then(/^I get an alert on my twitter feed$/) do
  
end

Given(/^I have been alerted to pending questions on twitter$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I click on the link in the tweet$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I get taken to the questions list$/) do
  pending # express the regexp above with the code you wish you had
end