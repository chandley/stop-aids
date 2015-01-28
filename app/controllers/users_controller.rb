class UsersController < ApplicationController

  def create
    puts post_params
    User.create(:email => params[:email])
    render :nothing => true
  end

  def post_params
    params.require(:email)
  end

  def thankyou
  end

end
