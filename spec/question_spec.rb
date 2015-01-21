require 'rails_helper'

describe Question do

  context 'answers' do

    before do
      @red_or_blue = Question.create(ask_text: 'Would you rather red pill or blue pill?')
      @alice = Candidate.create(name: 'Alice')
      @red_or_blue.create_answer(@alice, 'blue pill')
    end

    it 'can create an answer' do         
      expect(Answer.all.count).to eq 1
    end

    it 'can have an answer' do
      expect(@red_or_blue.answers.count).to eq 1
    end

  end

end