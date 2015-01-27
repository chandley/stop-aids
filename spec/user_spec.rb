require 'rails_helper'

describe User do

  context 'creation' do

    before do
      @user = User.create(email:'test@test.com', 
                          password: 'testtest', 
                          password_confirmation: 'testtest'
                         )
    end


    it 'should let you create a user' do     
      expect(User.all.count).to eq 1
    end

    it 'can get a constituency id from a postcode' do
      pa_id = @user.get_constituency_pa_id_from_postcode('N1 2EN')
      expect(pa_id).to eq ("335")
    end


  end

end