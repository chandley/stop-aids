class ConstituenciesController < ApplicationController
  def show
    @contituency = Constituency.find(params[:id])
    render json: @contituency
  end
end
