class UsersController < ApplicationController

  def create
    created_user = User.create(:email => params[:email])
    p '**********'
    Notifier.welcome(params[:email])
    p '**********'
    render :nothing => true
  end

  def post_params
    params.require(:email)
  end

  def thankyou
  end

end
