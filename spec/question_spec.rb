require 'rails_helper'

describe Question do

  context 'answers' do

    it 'can create an answer' do 
      q1 = Question.create(ask_text: 'Would you rather red pill or blue pill?')
      q1.create_answer(1, 'blue pill')
      expect(Answer.all.count).to eq 1
    end

    it 'can have an answer' do
      q1 = Question.create(ask_text: 'Would you rather red pill or blue pill?')
      q1.create_answer(1, 'red pill')
      expect(q1.answers.count).to eq 1

    end

  end

end