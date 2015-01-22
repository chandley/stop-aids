class AnswersController < ApplicationController
  def create
    p params[:candidate_id]
    p params[:question_id]
    p params[:answer_text]
    Answer.create(candidate_id: params[:candidate_id], 
                  question_id:  params[:question_id], 
                  response:     params[:answer_text]  
                  )
  end

  def new
  end


end
