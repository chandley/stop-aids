require 'rails_helper'

describe Ask do

  context 'asking a question' do

    before do
      @user = User.create(email:'test@test.com')
      @candidate = Candidate.create(name: 'Alice')
      @question = Question.create(ask_text: 'Would you rather red pill or blue pill?')
      @ask = Ask.create(user_id: @user.id, candidate_id: @candidate.id, question_id: @question.id)
    end

    it 'should create an ask object with the user id, candidate id, and question id' do
      expect(@ask.question_id).to eq @question.id
      expect(@ask.user_id).to eq @user.id
      expect(@ask.candidate_id).to eq @candidate.id
    end

    it 'should associate the ask with the question' do
      expect(@question.asks.count).to eq 1
    end

    it 'should associate the ask with the candidate' do
      expect(@candidate.asks.count).to eq 1
    end

    it 'should associate the ask with the user' do
      expect(@candidate.asks.count).to eq 1
    end

  end

end