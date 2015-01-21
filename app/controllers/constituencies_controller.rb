class ConstituenciesController < ApplicationController
  def show
    @contituency = Constituency.find(params[:id])
    response.headers["Content-Type"] = "application/javascript"
    render json: {constituency :@contituency}, callback: params['callback']
  end
end
