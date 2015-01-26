class CandidatesController < ApplicationController
  protect_from_forgery except: [:index, :show]

  respond_to :json
  def show
    render_api :candidate => Candidate.find(params[:id]) 
  end

  def index
    render_api :candidates => Candidate.all 
  end

  def update
    selected_candidate = Candidate.find(params[:id])
    selected_candidate.update!(patch_params)
    render :nothing => true
  end

  def patch_params
    params.permit(:name, :twitter)
  end

  def post_params
    params.require(:name, :constituency_id).permit(:twitter)
  end


  def create
    Candidate.create( :name         => params[:name], 
                      :constituency_id => params[:constituency_id] )
    render :nothing => true
  end

  def destroy
    Candidate.find(params[:id]).destroy
    render :nothing => true
  end

 
end
