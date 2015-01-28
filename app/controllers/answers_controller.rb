class AnswersController < ApplicationController

  def create
    asked_question = Question.find(params[:question_id] )
    candidate = Candidate.find(params[:candidate_id] )
    new_answer = asked_question.create_answer(candidate, Choice.find(params[:choice_id]) )
    new_answer.alert_all_askers
    render :nothing => true
  end

  def new
  end

  def post_params
    #permit post?
    params.require(:candidate_id).permit(:question_id, :choice_id)
  end
end
