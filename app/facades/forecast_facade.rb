class ForecastFacade
  class << self
    def service
      ForecastService.new
    end

    def forecast(lat, lng)
      forecast = service.get_data(lat, lng)
      Forecast.new(forecast)
    end
  end
end
