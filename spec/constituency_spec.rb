require 'rails_helper'


describe Constituency do

  before do
    @alice = Candidate.create(name: 'Alice')
    @bob = Candidate.create(name: 'Bob')
    @constituency = Constituency.create(name: 'Bethnal Green and Bow')
  end

  it 'it should start with no candidates' do
    expect(@constituency.candidates.count).to eq(0) 
  end

  # it "should not have any answered questions" do

  # end


end
