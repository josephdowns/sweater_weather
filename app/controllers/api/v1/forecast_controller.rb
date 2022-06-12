class Api::V1::ForecastController < ApplicationController
  def index
    geocode = MapquestFacade.get_geocode(params[:location])
    binding.pry

    render json: ForecastSerializer.new(geocode.lat, geocode.lng)
  end
end
