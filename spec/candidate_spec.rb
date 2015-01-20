require 'rails_helper'


describe Candidate do

  context "when initialized" do

    before do
      Candidate.create(name: 'Alice')
      Question.create(ask_text: 'Would you rather red pill or blue pill?')
      Question.create(ask_text: 'Would you rather war or famine?')
      Question.create(ask_text: 'Would you rather beef or chicken?')
    end

    it 'it should show the candidates name on the apropriate page' do
      visit '/candidates/1'
      expect(page).to have_content 'Alice'
    end

    it 'it should show the questions list on the api' do
      visit '/candidates/1/questions'
      expect(page).to have_content 'beef or chicken'
    end

    # it "should not have any answered questions" do

    # end

  end
end
