class QuestionsController < ApplicationController

  def index 

    if params[:filter] == 'answered'
      @questions = Question.all.reject {|q| q.answers.count == 0}
    elsif params[:filter] == 'unanswered'
      @questions = Question.all.select {|q| q.answers.count == 0}
    else
      @questions = Question.all
    end

    render_api ( {:candidate_id => params[:candidate_id],
                  :questions => @questions
                 } )
  end

  def show
    render_api :question => Question.find(params[:id]).choices
  end

  def unanswered
    params[:filter] = 'unanswered'
    index
  end

  def answered
    params[:filter] = 'answered'
    index
  end

  def random_unanswered
    render_api ( {:candidate_id => params[:candidate_id],
                  :questions => Question.all.select {|q| q.answers.count == 0}.sample
                 } )
  end

end
