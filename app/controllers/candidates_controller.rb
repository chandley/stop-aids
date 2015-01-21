class CandidatesController < ApplicationController


  respond_to :json
  def show
    @candidate = Candidate.find(params[:id])
    response.headers["Content-Type"] = "application/javascript"
    render json: @candidate, callback: params['callback']
  end

  def index
    @candidates = Candidate.all
    response.headers["Content-Type"] = "application/javascript"
    render json: {candidates: @candidates}, callback: params['callback']
  end

  
end
