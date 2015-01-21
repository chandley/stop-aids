class CandidatesController < ApplicationController
  def show
    @candidate = Candidate.find(params[:id])
    render json: @candidate, callback: params['callback']
  end

  def index
    @candidates = Candidate.all
    render json: @candidates, callback: params['callback']
  end
end
