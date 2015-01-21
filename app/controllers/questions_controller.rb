class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    render json: {candidate_id: params[:candidate_id],
                  questions: @questions}, callback: params['callback']
  end

  def unanswered
    @questions = Question.all.select {|q| q.answers.count == 0}
    render json: {candidate_id: params[:candidate_id],
                  questions: @questions}, callback: params['callback']
  end

  def answered
    @questions = Question.all.reject {|q| q.answers.count == 0}
    render json: {candidate_id: params[:candidate_id],
                  questions: @questions}, callback: params['callback']
  end
end
