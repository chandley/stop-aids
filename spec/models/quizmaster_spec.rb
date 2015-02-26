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
      @bob = Candidate.create(name: 'Bob')
      @candidates = [@alice, @bob]
      @constituency = Constituency.create(name: 'Bethnal Green and Bow')
      @red_or_blue = Question.create(ask_text: 'Would you rather red pill or blue pill?')
      Question.create(ask_text: 'Would you rather war or famine?')
      Question.create(ask_text: 'Would you rather beef or chicken?')
    end

    it 'it can find questions that have been asked three times' do

      @students.each do |student|
        Ask.create(candidate_id: @alice.id, 
                  question_id:  @red_or_blue.id, 
                  user_id:     student.id  
                  )
      end
      expect(@quizmaster.popular_questions(@alice)).to include(@red_or_blue)
    end

    it 'can find a list of candidates from a postcode' do
      #won't work with test database
      hash = @quizmaster.get_constituency_candidates_from_postcode('n1 2en')
      expect(hash[candidates][4].name).to eq('Terry Stacy')
    end

    it 'can find one candidate only from postcode' do

    end

  end

end
