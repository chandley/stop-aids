class UsersController < ApplicationController

  def create
    puts post_params
    User.create(post_params)
  end

  def post_params
    params.require(:email, :password, :password_confirmation)
  end

  def show_answered_asks
    candidate = Candidate.find(params[:candidate_id])
    questions = answered_questions_asked_to(candidate)
    questions.map { |question| ask_text: question.ask_text, choice_text: candidate.answer_choice_to(qustion).text }
  end

end
