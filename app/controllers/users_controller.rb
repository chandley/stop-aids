class UsersController < ApplicationController

  def create
    puts post_params
    created_user = User.create(:email => params[:email])
    render_api { :user_id => created_user.id }
  end

  def post_params
    params.require(:email)
  end

  def thankyou
  end

end
