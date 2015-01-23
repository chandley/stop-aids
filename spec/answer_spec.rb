require 'rails_helper'

describe Answer do

  before do
    @alice = Candidate.create(name: 'Alice')
    @bob = Candidate.create(name: 'Bob')
    @constituency = Constituency.create(name: 'Bethnal Green and Bow')
    @red_or_blue = Question.create(ask_text: 'Would you rather red pill or blue pill?')
  end

  it 'it should allow an answer in the question' do
    @red_or_blue.create_answer(@alice, 'blue pill') 
    expect(@red_or_blue.answered_by?(@alice)).to be true
  end

  it 'it should not allow a third choice' do
    expect(@red_or_blue.create_answer(@alice, 'not an answer')).to raise('not a permitted answer') 
  end

end

