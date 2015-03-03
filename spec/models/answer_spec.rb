require 'rails_helper'

describe Answer do

  before do
    @alice = Candidate.create(name: 'Alice')
    @red_or_blue = Question.create(ask_text: 'Would you rather red pill or blue pill?')
    @blue = Choice.create(text: 'Blue pill', question_id: @red_or_blue.id)
  end

  it 'it should allow an answer in the question' do
    @red_or_blue.create_answer(@alice, @blue) 
    expect(@red_or_blue.answered_by?(@alice)).to be true
  end

end

