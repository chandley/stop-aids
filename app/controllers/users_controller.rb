class UsersController < ApplicationController

  def create
    puts post_params
    User.create(post_params)
  end

  def post_params
    params.require(:email, :password, :password_confirmation)
  end

  def thankyou
  end

end
