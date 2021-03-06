require 'rails_helper'


describe Candidate do

  context "when initialized" do

    before do
      @constituency = Constituency.create(name: 'Bethnal Green and Bow')
      @candidate = Candidate.create(name: 'Alice', constituency_id: @constituency.id)
      Candidate.create(name: 'Bob', constituency_id: @constituency.id)
      Question.create(ask_text: 'Would you rather red pill or blue pill?')
      Question.create(ask_text: 'Would you rather war or famine?')
      Question.create(ask_text: 'Would you rather beef or chicken?')
    end

    it 'it should show the candidate api' do
      visit "/candidates/#{@candidate.id}"
      expect(page).to have_content 'Alice'
    end

    it 'it should show the candidates on the constituency api' do
      visit "/constituencies/#{@constituency.id}/candidates"
      expect(page).to have_content 'Bob'
    end

    it 'it should show the constituency api' do
      visit "/constituencies/#{@constituency.id}"
      expect(page).to have_content 'Bethnal Green'
    end

  end

  context 'questions' do

    before do
      @candidate = Candidate.create(name: 'Alice')
      Candidate.create(name: 'Bob')
      @constituency = Constituency.create(name: 'Bethnal Green and Bow')
      Question.create(ask_text: 'Would you rather red pill or blue pill?')
      Question.create(ask_text: 'Would you rather war or famine?')
      Question.create(ask_text: 'Would you rather beef or chicken?')
    end

    it 'it should show the questions on the candidate api' do
      visit "/candidates/#{@candidate.id}/questions"
      expect(page).to have_content 'beef or chicken'
    end


  end

  context 'students asking questions' do

    before do
      @red_or_blue = Question.create(ask_text: 'Would you rather red pill or blue pill?')
      @war_or_famine = Question.create(ask_text: 'Would you rather war or famine?')
      @beef_or_chicken = Question.create(ask_text: 'Would you rather beef or chicken?')
      @alice = Candidate.create(name: 'Alice') 
      @student1 = User.create(email: 'Neil@uni.ac.uk')
      @student2 = User.create(email:'Vyvyan@uni.ac.uk')
      @student3 = User.create(email: 'Rick@uni.ac.uk') 
      @students = [@student1, @student2, @student3] 
    end

    it 'should know which questions have been asked three times' do
      @students.each do |student|
        student.asks_to(@alice, @red_or_blue)
      end
      expect(@alice.questions_asked_more_times_than(2)).to include(@red_or_blue)
      expect(@alice.questions_asked_more_times_than(2)).to_not include(@war_or_famine)

    end

  end

  context 'answering questions' do

    before do
      @red_or_blue = Question.create(ask_text: 'Would you rather red pill or blue pill?')
      Choice.create(question_id: @red_or_blue.id, text: "red pill")
      @war_or_famine = Question.create(ask_text: 'Would you rather war or famine?')
      @beef_or_chicken = Question.create(ask_text: 'Would you rather beef or chicken?')
      @alice = Candidate.create(name: 'Alice') 
      @student1 = User.create(email: 'Neil@uni.ac.uk')
      @student2 = User.create(email:'Vyvyan@uni.ac.uk')
      @student3 = User.create(email: 'Rick@uni.ac.uk') 
      @students = [@student1, @student2, @student3] 
    end

    it 'knows if it has answered a question' do
      @student1.asks_to(@alice, @red_or_blue)
      @alice.answer_question(@red_or_blue, @red_or_blue.choices.first)
      expect(@alice.has_answered?(@red_or_blue)).to be(true)
    end

    it 'knows what answer it has given to a question' do
      @alice.answer_question(@red_or_blue, @red_or_blue.choices.first)
      expect(@alice.answer_choice_to(@red_or_blue).text).to eq('red pill')
    end
    

  end


end
