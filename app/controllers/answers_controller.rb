class AnswersController < ApplicationController

  def create

    asked_question = Question.find(params[:question_id] )
    candidate = Candidate.find(params[:candidate_id] )
    asked_question.create_answer(candidate, Choice.find(params[:choice_id]) )

    # Answer.create(candidate_id: params[:candidate_id], 
    #               question_id:  params[:question_id], 
    #               response:     params[:answer_text]  
    #               )
    render :nothing => true

    # Answer.create(params)
  end

  def new
  end

  def post_params
    #permit post?
    params.require(:candidate_id).permit(:question_id, :choice_id)
  end
end
