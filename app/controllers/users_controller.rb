class UsersController < ApplicationController

  def create
    puts post_params
    user = User.create(:email => params[:email])
    Notifier.welcome(user.email).deliver
    render :nothing => true
  end

  def post_params
    params.require(:email)
  end

  def thankyou
  end

end
