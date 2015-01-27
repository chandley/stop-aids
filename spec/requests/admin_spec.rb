it "accesses the dashboard" do 
  User.create( 
    email: 'user@example.com', 
    password: 'secret', 
    password_confirmation: 'secret' 
    ) 

  visit root_path 
  click_link 'Sign In' 
  fill_in 'Email', with: 'user@example.com' 
  fill_in 'Password', with: 'secret' 
  click_button 'Sign In' 

  current_path.should eq admin_dashboard_path 
  within 'h1' do 
    page.should have_content 'Administration' 
  end 
  page.should have_content 'Manage Users' 
  page.should have_content 'Manage Articles' 
end