require 'rails_helper'

describe Ask do

  context 'asking a question' do

    before do
      @user = User.create(email:'test@test.com', password: 'testtest', password_confirmation: 'testtest')
      @candidate = Candidate.create(name: 'Alice')
      @question = Question.create(ask_text: 'Would you rather red pill or blue pill?')
    end

    it 'should create an ask object with the user id, candidate id, and question id' do
      @ask = Ask.create(user_id: @user.id, candidate_id: @candidate.id, question_id: @question.id)
      expect(@ask.question_id).to eq @question.id
    end

  end

end