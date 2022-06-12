class Api::V1::ForecastController < ApplicationController
  def index
    geocode = MapquestFacade.get_geocode(params[:location])
    render json: ForecastSerializer.new(params[:location])
  end
end
