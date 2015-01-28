require 'rails_helper'

describe User do

  context 'creation' do

    before do
      @user = User.create(email:'test@test.com')
    end


    it 'should let you create a user' do     
      expect(User.all.count).to eq 1
    end

    it 'can get a constituency id from a postcode' do
      pa_id = @user.get_constituency_pa_id_from_postcode('N1 2EN')
      expect(pa_id).to eq ("335")
    end


  end


  context 'asks questions' do

    before do
      @user = User.create(email:'test@test.com')
      @candidate = Candidate.create(name: 'Alice')
      @question = Question.create(ask_text: 'Would you rather red pill or blue pill?')
    end

    it 'can ask a question' do
      @user.asks_to(@candidate, @question)
      expect(@candidate.asks.map {|ask| ask.question_id}).to include(@question.id)
    end

    it 'knows which questions it has asked' do
      @user.asks_to(@candidate, @question)
      expect(@user.questions_asked_to(@candidate)).to include(@question)
    end

    it 'knows which asked questions have been answered' do

    end

  end
end