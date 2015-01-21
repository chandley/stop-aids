class ConstituenciesController < ApplicationController
  def show
    @contituency = Constituency.find(params[:id])
    response.headers["Content-Type"] = "application/javascript"
    render json: @contituency, callback: params['callback']
  end
end
