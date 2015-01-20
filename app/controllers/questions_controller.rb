class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    render json: {candidate_id: params[:candidate_id],
                  questions: @questions}
  end
end
