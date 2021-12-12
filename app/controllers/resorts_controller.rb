class ResortsController < ApplicationController
  def index
    resorts = Resort.all
    render json: resorts.as_json
  end

  def show
    resort = Resort.find_by(id: params[:id])
    render json: resort.as_json
  end

  def nearby_resorts
    results = Geocoder.search(params[:address])
    coordinates = results.first.coordinates
    resorts = Resort.all
    resorts_distances = []

    resorts.each do |resort|
      distance = Geocoder::Calculations.distance_between(coordinates, [resort.lat, resort.lng])
      resorts_distances << {
        distance: distance,
        name: resort.name,
        lat: resort.lat,
        lng: resort.lng,
        website: resort.official_website
      } 
    end

    sorted_distances = resorts_distances.sort_by { |k| k[:distance] }
    closest_five_resorts = sorted_distances.first(5)

    render json: closest_five_resorts
  end
end
