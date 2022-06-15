class ForecastFacade
  class << self
    def service
      ForecastService.new
    end

    def forecast(lat, lng)
      forecast = service.get_data(lat, lng)
      Forecast.new(forecast)
    end

    def future_forecast(lat, lng, trip_time)
      forecast = service.get_data(lat, lng)
      hourly_weather = forecast[:hourly].map do |hour|
        HourlyForecast.new(hour)
      end
      eta = hours(trip_time)
      hourly_weather[eta]
    end

    def hours(trip_time)
      if trip_time.split(':')[0].to_i > 8
    end
  end
end
