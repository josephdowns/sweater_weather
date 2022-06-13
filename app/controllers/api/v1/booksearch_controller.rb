class Api::V1::BooksearchController < ApplicationController
  def index
    geocode = MapquestFacade.get_geocode(params[:location])
    forecast = ForecastFacade.forecast(geocode.lat, geocode.lng)
    books = BooksearchFacade.results_by_location(params[:location], params[:quantity].to_i)
    render json: BooksearchSerializer.new(books, forecast, params[:location])
  end
end
