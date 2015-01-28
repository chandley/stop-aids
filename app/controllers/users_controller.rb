class UsersController < ApplicationController

  def create
    puts post_params
    created_user = User.create(:email => params[:email])
    render :nothing => true
  end

  def post_params
    params.require(:email)
  end

  def thankyou
  end

end
