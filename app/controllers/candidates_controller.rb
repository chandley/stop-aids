class CandidatesController < ApplicationController
  def show
    @candidate = Candidate.find(params[:id])
    render json: @candidate
  end

  def index
    @candidates = Candidate.all
    render json: @candidates
  end

  def questions_unanswered
    p
  end
end
