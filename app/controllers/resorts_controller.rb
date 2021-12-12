class ResortsController < ApplicationController
  def index
    resorts = Resort.all
    render json: resorts.as_json
  end

  def show
    resort = Resort.find_by(id: params[:id])
    render json: resort.as_json
  end 
end
