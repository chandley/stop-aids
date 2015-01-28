class QuizmasterController < ApplicationController

  def constituency_and_candidates_from_postcode
    render_api ( Quizmaster.new.get_constituency_candidates_from_postcode(params[:postcode]) )
  end

  def constituency_and_one_candidate_from_postcode
    render_api ( Quizmaster.new.get_constituency_first_only_candidate_from_postcode(params[:postcode]) )
  end

  def post_params
    params.require(:postcode)
  end
  
end
