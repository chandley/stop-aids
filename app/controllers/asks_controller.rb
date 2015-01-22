class AsksController < ApplicationController

  def create
    Ask.create(candidate_id: params[:candidate_id], 
                  question_id:  params[:question_id], 
                  user_id:     params[:user_id]  
                  )
    render :nothing => true

    # Answer.create(params)
  end

  def post_params
    #permit post?
    params.require(:candidate_id).permit(:question_id, :user_id)
  end

  def index
    render_api :asks => Question.find(Ask.all.first.question_id).ask_text
  end

end
