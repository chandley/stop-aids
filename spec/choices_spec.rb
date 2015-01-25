require 'rails_helper'

describe Choice do

  before do
    @red_or_blue = Question.create(ask_text: 'Would you rather red pill or blue pill?')
    @red = Choice.create(text: 'Red', question_id: @red_or_blue.id)
    @blue = Choice.create(text: 'Blue', question_id: @red_or_blue.id)
  end

  it 'should have a question' do
    expect(@red.question).to eq @red_or_blue
  end

end