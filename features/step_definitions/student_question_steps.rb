Given(/^there are no users$/) do
  expect(User.all.count).to eq(0)
end

# When(/^I submit my details$/) do
#   # pending post "users/create",    :email => 'user@example.com', 
#   #                   :password => 'password',
#   #                   :password_confirmation => 'password'
# end

# Then(/^I am registered as a user$/) do
#   #ßpending expect(User.all.count).to eq(1)
# end
