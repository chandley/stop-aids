When(/^the administrator adds a question by api$/) do
  page.driver.post( "/questions",
                   :ask_text => "do you like pizza or kebabs" )
end

Then(/^I get JSON kebab question text$/) do
  expect(page).to have_content("pizza or kebabs")
end

When(/^the administrator edits candidate information$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^we see the updated information for candidate$/) do
  pending # express the regexp above with the code you wish you had
end