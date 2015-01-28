class CandidatesController < ApplicationController
  protect_from_forgery except: [:index, :show]

  respond_to :json
  def show
    render_api :candidate => Candidate.find(params[:id]) 
  end

  def index
    #TODO care constituence uses pa_id for constituency_id
    render_api :candidates => Candidate.where(constituency_id: params[:constituency_id])
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

  def show_answered_asks
    candidate = Candidate.find(params[:candidate_id]) 
    user = User.find(params[:user_id])
    questions = user.answered_questions_asked_to(candidate)
    return_array = questions.map { |question| {ask_text: question.ask_text, choice_text: candidate.answer_choice_to(question).text} }

    render_api ({ candidate_id: candidate.id, 
                  candidate_name: candidate.name,
                  user_id: user.id, 
                  answered_asks: return_array } )

  end

 
end
