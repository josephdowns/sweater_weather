class Api::V1::ForecastController < ApplicationController
  def index
    geocode = MapquestFacade.get_geocode(params[:location])
    forecast = ForecastFacade.forecast(geocode.lat, geocode.lng)
    render json: ForecastSerializer.new(forecast)
  end
end
