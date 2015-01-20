

Given(/^we have a candidate$/) do
  Candidate.create(name: 'Alice')
end

Given(/^we have some candidates$/) do
  Candidate.create(name: 'Alice')
  Candidate.create(name: 'Bob')
end

Given(/^we have some questions$/) do
  Question.create(ask_text: 'Would you rather red pill or blue pill?')
  Question.create(ask_text: 'Would you rather war or famine?')
  Question.create(ask_text: 'Would you rather beef or chicken?')
end

Given(/^we have a constituency$/) do
  Constituency.create(name: 'Bethnal Green and Bow')
end

When(/^I visit the candidate api$/) do
  visit '/candidates/1'
end

When(/^I visit the candidate questions api$/) do
  visit '/candidates/1/questions'
end

When(/^I visit the constituency api$/) do
  visit '/constituencies/1'
end

When(/^I visit the constituency candidates api$/) do
  visit '/constituencies/1/candidates'
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
