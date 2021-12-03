class TripsController < ApplicationController
  trip = Trip.new(
    resort_id: params[:resort_id],
    day_start: params[:day_start],
    day_end: params[:day_end],
    user_id: params[:user_id],
    original_query: params[:original_query]
  )
  if trip.save
    render json: { message: "Trip created successfully" }, status: :created
  else
    render json: { errors: trip.errors.full_messages }, status: :bad_request
  end
end
