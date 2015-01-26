Given(/^we have two constituencies$/) do
  @firstcon = Constituency.create(name: 'Bethnal Green and Bow')
  @secondcon = Constituency.create(name: 'Dulwich and West Norwood')
end

Given(/^we have candidates for each constituency$/) do
  @bob = Candidate.create(name: 'Bob', constituency_id: @firstcon.id)
  @alice = Candidate.create(name: 'Alice', constituency_id: @secondcon.id)
end

When(/^I visit the first constituency candidates api$/) do
  visit "/constituencies/#{@firstcon.id}/candidates"
end

Then(/^I see candidates from the first constituency only$/) do
  expect(page).to have_content 'Bob'
  expect(page).to_not have_content 'Alice'
end