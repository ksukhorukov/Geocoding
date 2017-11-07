class SearchesController < ApplicationController
  def index
    location = params[:location]
    geocoder = Geocoder.new(location)
    render json: geocoder.response
  end
end
