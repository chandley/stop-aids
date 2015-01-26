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

  it "only sees it's own candidates" do
    @second = Constituency.create(name: 'Dulwich and West Norwood')
    @second.add_candidate(@bob)
    @constituency.add_candidate(@alice)
    expect(@constituency.candidates).to include(@alice)
    expect(@constituency.candidates).to_not include(@bob)
  end

end
