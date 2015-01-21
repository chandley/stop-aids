class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def render_api (json_hash)
    response.headers["Content-Type"] = "application/javascript" # prevents MIME error with js 
    render json: json_hash, callback: params['callback']
  end
end
