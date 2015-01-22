require 'rails_helper'

describe User do

  context 'creation' do


    it 'should let you create a user' do
      @user = User.create(email:'test@test.com', password: 'testtest', password_confirmation: 'testtest')
      expect(User.all.count).to eq 1
    end

  end

end