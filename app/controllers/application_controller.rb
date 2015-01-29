class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  #protect_from_forgery unless: -> { request.headers["Content-Type"] = "application/javascript" }
  protect_from_forgery except: [:index, :show]

  def render_api (json_hash)
    response.headers["Content-Type"] = "application/javascript" 
  
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS, PATCH'
    response.headers['Access-Control-Max-Age'] = "1728000"

    # prevents MIME error with js 
    render json: json_hash, callback: params['callback']
  end

  # def check_tweet
  #   answer_tweet = $twitter.search( "to:chrisrhandley", 
  #                     result_type: "recent"
  #                   ).first
  #   question_tweet = $twitter.status(answer_tweet.in_reply_to_status_id)
  #   puts question_tweet.text
  #   puts answer_tweet.text
  # end
end
