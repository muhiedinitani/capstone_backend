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
        id: resort.id,
        name: resort.name,
        lat: resort.lat,
        lng: resort.lng,
        official_website: resort.official_website
      } 
    end

    sorted_distances = resorts_distances.sort_by { |k| k[:distance] }
    closest_five_resorts = sorted_distances.first(5)

    render json: closest_five_resorts
  end

  def get_location
    require "json"
    require "uri"
    require "net/http"

    url = URI("https://maps.googleapis.com/maps/api/geocode/json?address=#{params[:address]}&key=#{Rails.application.credentials.gmaps_api_key}")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)
    render json: JSON.parse(response.read_body)

    # response_json = JSON.parse(response.read_body)
    # render json: response_json["results"][0]["geometry"]["location"].as_json
  end

  def nearby_search
    require "json"
    require "uri"
    require "net/http"

    url = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{params[:location]}&type=point_of_interest&keyword=ski+resort&radius=500000&key=#{Rails.application.credentials.gmaps_api_key}")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)
    render json: response.read_body
  end

end
