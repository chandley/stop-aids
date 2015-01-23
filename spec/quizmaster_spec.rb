require 'rails_helper'


describe Quizmaster do

  context "running the quiz" do

    before do
      @quizmaster = Quizmaster.new
      @student1 = User.create(email: 'Neil@uni.ac.uk')
      @student2 = User.create(email:'Vyvyan@uni.ac.uk')
      @student3 = User.create(email: 'Rick@uni.ac.uk')
      @students = [@student1, @student2, @student3]

      @alice = Candidate.create(name: 'Alice')
      @constituency = Constituency.create(name: 'Bethnal Green and Bow')
      @red_or_blue = Question.create(ask_text: 'Would you rather red pill or blue pill?')
      Question.create(ask_text: 'Would you rather war or famine?')
      Question.create(ask_text: 'Would you rather beef or chicken?')
    end

    it 'it can find questions that have been asked three times' do
      THRESHOLD = 3 
      @students.each do |student|
        Ask.create(candidate_id: @alice.id, 
                  question_id:  @red_or_blue.id, 
                  user_id:     student.id  
                  )
      end
      expect(@quizmaster.popular_questions(@alice)).to contain (@red_or_blue)
    end

  end

end
