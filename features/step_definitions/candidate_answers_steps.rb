Given(/^we have asked questions for a candidate$/) do
  step('we have some questions with choices for a candidate')
  @adrian = User.create(email: 'adrian@uu.com')
  @ben = User.create(email: 'ben@uu.com')
  @ben_asks_alice_redblue = Ask.create(user_id: @ben.id, question_id: @red_or_blue.id, candidate_id: @alice.id)
  @adrian_asks_alice_redblue = Ask.create(user_id: @adrian.id, question_id: @red_or_blue.id, candidate_id: @alice.id)
end

When(/^number of asks reaches a certain threshold$/) do
  pending
end

Then(/^I get an alert on my twitter feed$/) do
  pending
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

Then(/^I see the available choices for each question$/) do
  expect(page).to have_content('Beef')
end

Then(/^I see the number of times each question has been asked$/) do
  expect(page).to have_content("\"number_of_asks\":2")
end