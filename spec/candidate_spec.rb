require 'candidate'
require 'spec_helper'
# require 'answer'

describe Candidate do

  context "when initialized" do

    before do
      candidate = Candidate.new(name: 'Alice')
      q1 = Question.new(ask_text: 'Would you rather red pill or blue pill?')
      q2 = Question.new(ask_text: 'Would you rather war or famine?')
      q3 = Question.new(ask_text: 'Would you rather beef or chicken?')
    end

    it 'it should show the candidates name on the apropriate page' do
      visit '/candidates/1'
      expect(page).to have_content 'Alice'
    end

    it "should not have any answered questions" do

    end

  end
end
