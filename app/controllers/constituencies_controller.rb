class ConstituenciesController < ApplicationController

  def show
    render_api :constituency => Constituency.find(params[:id]) 
  end
  
end
