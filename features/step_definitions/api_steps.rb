

Given(/^we have a candidate$/) do
  Candidate.create(name: 'Alice')
end

When(/^I visit the candidate api address$/) do
  visit '/candidates/1'
end

Then(/^I get JSON candidate name$/) do
  expect(page).to have_content 'Alice'
end

Given(/^we have some questions$/) do
  Question.create(ask_text: 'Would you rather red pill or blue pill?')
  Question.create(ask_text: 'Would you rather war or famine?')
  Question.create(ask_text: 'Would you rather beef or chicken?')
end

When(/^I visit the candidate questions api address$/) do
  visit '/candidates/1/questions'
end

Then(/^I get JSON question text$/) do
  expect(page).to have_content 'beef or chicken'
end

Given(/^we have a constituency$/) do
  Constituency.create(name: 'Bethnal Green and Bow')
end

When(/^I visit the constituency api$/) do
  visit '/constituencies/1'
end

Then(/^I get JSON constituency name$/) do
  expect(page).to have_content 'Bethnal Green'
end

Given(/^we have some candidates$/) do
  Candidate.create(name: 'Alice')
  Candidate.create(name: 'Bob')
end

When(/^I visit the constituency candidates api$/) do
  visit '/constituencies/1/candidates'
end

Then(/^I get JSON candidate names for constituency$/) do
  expect(page).to have_content 'Bob'
end

Given(/^we have some questions for a candidate$/) do
  step('we have some questions')
  p Question.first
end

Given(/^I answer a question$/) do
  Question.first.create_answer(1,1,'whatever')
end

When(/^I visit the unanswered candidate questions api$/) do
  # visit '/candidates/1/questions/unanswered'
  # visit '/candidates/1/questions_unanswered'
  # visit '/candidates/1/questions/=filterby=>unaswered'
end

Then(/^I get JSON unanswered questions only$/) do
  expect(page).to not_contain('red pill')
end
