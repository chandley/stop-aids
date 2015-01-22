class AnswersController < ApplicationController
  def create
    Answer.create(candidate_id: params[:candidate_id], 
                  question_id:  params[:question_id], 
                  response:     params[:answer_text]  
                  )
    render :nothing => true

    # Answer.create(params)
  end

  def new
  end

  def post_params
    #permit post?
    params.require(:candidate_id).permit(:question_id, :answer_text)
  end
end
