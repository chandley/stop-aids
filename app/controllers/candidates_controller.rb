class CandidatesController < ApplicationController
  def show
    @candidate = Candidate.find(params[:id])
    render json: @candidate
  end
end
