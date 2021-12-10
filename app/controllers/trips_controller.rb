class TripsController < ApplicationController
  before_action :authenticate_user, only: [:create] #you can add more methods if needed. add a comma after :create

  def create
    trip = Trip.new(
      resort_id: params[:resort_id],
      day_start: params[:day_start],
      day_end: params[:day_end],
      user_id: current_user.id,
      original_query: params[:original_query]
    )
    if trip.save
      render json: { message: "Trip created successfully and creator is #{current_user.id}" }, status: :created
    else
      render json: { errors: trip.errors.full_messages }, status: :bad_request
    end
  end

end
