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
    
    asks = Ask.where(:candidate_id == params[:candidate_id])
    question_id_arr = asks.map {|ask| ask.question_id}
    asked_questions = []
    question_id_arr.each do |asked_question_id|
      question = Question.find(asked_question_id)
      asked_questions << question
    end

    render_api ({candidate_id: params[:candidate_id], 
                 asks: asks,  
                 asked_questions: asked_questions } )
  end

end
