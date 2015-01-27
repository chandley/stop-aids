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
    
    asks = Ask.where({:candidate_id => params[:candidate_id], 
                      :user_id => params[:user_id]})
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

  def student_show_answered_asks

    asks = Ask.where({:candidate_id => params[:candidate_id], 
                      :user_id => params[:user_id]})
    return_array = []

    asks.each do |ask|
      answer = Answer.where(:candidate_id => params[:candidate_id],
                            :question_id => ask.question_id).take
      choice_text = Choice.find(answer.choice_id).text
      return_array << {ask_text: ask.question.ask_text, choice_text: choice_text}
    end

    return_array.select {|ask| !ask[:choice_text]}
    
    render_api ({ candidate_id: params[:candidate_id], 
                  user_id: params[:user_id], 
                  answered_asks: return_array } )

  end

  # def give_answers(asks, params)
  #   return_array = []
  #   asks.each do |ask|
  #     question_text = Question.find(ask.question_id).ask_text
  #     answer = Answer.where(:candidate_id => params[:candidate_id],
  #                           :question_id => ask.question_id).take
  #     choice_text = Choice.find(answer.choice_id).text
  #     return_array << {ask_text: question_text, choice_text: choice_text}
  #   end
  #   return_array.select {|ask| !ask[:choice_text]}
  # end

end
