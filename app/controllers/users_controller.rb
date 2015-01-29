class UsersController < ApplicationController

  def create
    created_user = User.create(:email => params[:email])
    Notifier.welcome(params[:email]).deliver
    render :nothing => true
  end

  def post_params
    params.require(:email)
  end

  def thankyou
  end

end
