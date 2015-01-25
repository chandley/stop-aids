When(/^the administrator adds a question by api$/) do
  page.driver.post("/questions",
                  :ask_text => "do you like pizza or kebabs",  
                  )
end

Then(/^I get JSON kebab question text$/) do
  expect(page).to have_content("pizza or kebabs")
end