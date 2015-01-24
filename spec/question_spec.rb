require 'rails_helper'

describe Question do

  context 'answers' do

    before do
      @red_or_blue = Question.create(ask_text: 'Would you rather red pill or blue pill?')
      @red = Choice.create(text: 'Red', question_id: @red_or_blue.id)
      @blue = Choice.create(text: 'Blue', question_id: @red_or_blue.id)
      @alice = Candidate.create(name: 'Alice') 
      @student1 = User.create(email: 'Neil@uni.ac.uk')
      @student2 = User.create(email:'Vyvyan@uni.ac.uk')
      @student3 = User.create(email: 'Rick@uni.ac.uk')  
    end   

    it 'can create an answer' do 
      @red_or_blue.create_answer(@alice, @blue)        
      expect(Answer.all.count).to eq 1
    end

    it 'can have an answer' do
      @red_or_blue.create_answer(@alice, @blue)
      expect(@red_or_blue.answers.count).to eq 1
    end

    it 'starts off unanswered' do
      expect(@red_or_blue.answered_by?(@alice)).to be false
    end
  
    it 'knows when it has been answered' do
      @red_or_blue.create_answer(@alice, @blue) 
      expect(@red_or_blue.answered_by?(@alice)).to be true
    end

  end

  context 'asking' do

    before do
      @red_or_blue = Question.create(ask_text: 'Would you rather red pill or blue pill?')
      @alice = Candidate.create(name: 'Alice') 
      @student1 = User.create(email: 'Neil@uni.ac.uk')
      @student2 = User.create(email:'Vyvyan@uni.ac.uk')
      @student3 = User.create(email: 'Rick@uni.ac.uk') 
      @students = [@student1, @student2, @student3] 
    end   

    it 'starts off not having been asked by anyone' do
      expect(@red_or_blue.asked_count(@alice)).to eq(0)
    end

    

  end

end