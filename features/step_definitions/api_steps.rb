

Given(/^we have a candidate$/) do
  Candidate.create(name: 'Alice')
end

When(/^I visit the candidate api address$/) do
  visit '/candidates/1'
end

Then(/^I get JSON candidates name$/) do
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

Then(/^I get JSON question data$/) do
  expect(page).to have_content 'beef or chicken'
end

Given(/^we have a constituency$/) do
  Constituency.create(name: 'Bethnal Green and Bow')
end

When(/^I visit the constituency api$/) do
  visit '/constituencies/1'
end

Then(/^I get JSON constituency name data$/) do
  expect(page).to have_content 'Bethnal Green'
end

Given(/^we have some candidates$/) do
  Candidate.create(name: 'Alice')
  Candidate.create(name: 'Bob')
end

When(/^I visit the constituency candidates api$/) do
  visit '/constituencies/1/candidates'
end

Then(/^I get JSON candidates for constituency data$/) do
  expect(page).to have_content 'Bob'
end
