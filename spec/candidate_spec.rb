require 'rails_helper'


describe Candidate do

  context "when initialized" do

    before do
      Candidate.create(name: 'Alice')
      Candidate.create(name: 'Bob')
      Constituency.create(name: 'Bethnal Green and Bow')
      Question.create(ask_text: 'Would you rather red pill or blue pill?')
      Question.create(ask_text: 'Would you rather war or famine?')
      Question.create(ask_text: 'Would you rather beef or chicken?')
    end

    it 'it should show the candidate api' do
      visit '/candidates/1'
      expect(page).to have_content 'Alice'
    end

    it 'it should show the questions on the candidate api' do
      visit '/candidates/1/questions'
      expect(page).to have_content 'beef or chicken'
    end

    it 'it should show the candidates on the constituency api' do
      visit '/constituencies/1/candidates'
      expect(page).to have_content 'Bob'
    end

    it 'it should show the constituency api' do
      visit '/constituencies/1'
      expect(page).to have_content 'Bethnal Green'
    end

    # it "should not have any answered questions" do

    # end

  end
end
