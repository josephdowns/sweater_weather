class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      trip_time = RoadTripFacade.new_trip(params[:origin], params[:destination])
      geocode = MapquestFacade.get_geocode(params[:destination])
      forecast = ForecastFacade.future_forecast(geocode.lat, geocode.lng, trip_time)
      render json: RoadTripSerializer.new(params[:origin], params[:destination], trip_time, forecast)
    else
      render json: {error: "Unauthorized"}, status: 401
    end
  end
end
