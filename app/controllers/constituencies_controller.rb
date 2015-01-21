class ConstituenciesController < ApplicationController
  def show
    @constituency = {:constituency => Constituency.find(params[:id]) }
    response.headers["Content-Type"] = "application/javascript"
    render json: @constituency, callback: params['callback']
  end
end
