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
    #TODO - can give this better structure if needed, otherwise delete

    user = User.find(params[:user_id])
    candidate = Candidate.find(params[:candidate_id])
    
    asks = Ask.where({:candidate_id => candidate.id, 
                      :user_id => user.id})
    asked_questions = user.questions_asked_to(candidate)

    render_api ({candidate_id: candidate.id, user_id: user.id,
                 asks: asks,  
                 asked_questions: asked_questions } )
  end


end
