require 'rails_helper'

describe Question do

  before do
    @red_or_blue = Question.create(ask_text: 'Would you rather red pill or blue pill?')
    @red = Choice.create(text: 'Red', question_id: @red_or_blue.id)
    @blue = Choice.create(text: 'Blue', question_id: @red_or_blue.id)
    @alice = Candidate.create(name: 'Alice')  
  end   

  context 'choices' do

    it 'can have choices' do
      expect(@red_or_blue.choices).to eq [@red, @blue]
    end

    it 'can be deleted' do
      

  end

  context 'answers' do


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
      @student1 = User.create(email: 'Neil@uni.ac.uk')
      @student2 = User.create(email:'Vyvyan@uni.ac.uk')
      @student3 = User.create(email: 'Rick@uni.ac.uk') 
      @students = [@student1, @student2, @student3] 
    end   

    it 'starts off not having been asked by anyone' do
      expect(@red_or_blue.asked_count(@alice)).to eq(0)
    end

    it 'knows how many times it has been asked' do
      Ask.create(user_id: @student3.id, candidate_id: @alice.id, question_id: @red_or_blue.id)
      expect(@red_or_blue.asked_count(@alice)).to eq(1)
    end

    it 'know when it has been asked more times than a given threshold' do
      threshold = 2
      expect(@red_or_blue.asked_more_times_than(@alice,threshold)).to be false
      @students.each do |student|
        Ask.create(user_id: student.id, candidate_id: @alice.id, question_id: @red_or_blue.id)
      end
      expect(@red_or_blue.asked_more_times_than(@alice,threshold)).to be true
    end

  end

end