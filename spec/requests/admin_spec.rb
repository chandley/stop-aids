require 'spec_helper'

describe 'site administration' do
  describe 'dashboard access' do
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
  page.should have_content 'Manage Questions' 
end

  it "is denied access when not logged in" do 
    visit admin_path 

    current_path.should eq login_path 
    within 'h1' do 
      page.should have_content 'Please Log In' 
    end 
  end

describe 'question management' do
    before :each do
      user = User.create(:user)
      sign_in user
    end

    it "adds a question" do
      click_link 'Manage Questions'
      current_path.should eq admin_questions_path
      
      expect{
        click_link 'New Question'
        fill_in 'Name', with: 'My favorite web framework'
        fill_in 'Body', with: 'Rails is great!'
        click_button 'Create Questions'
      }.to change(Question, :count).by(1)
      
      current_path.should eq admin_question_path
      page.should have_content 'My favorite web framework'
    end

