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

  it 'it can have a candidate' do
    @constituency.add_candidate(@bob)
    expect(@constituency.candidates).to include(@bob) 
  end

end
