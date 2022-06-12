class Forecast
  attr_reader :current_weather, :daily_weather, :hourly_weather

  def initialize(data)
    @current_weather = CurrentForecast.new(data[:current])
    @daily_weather = five_day_forecast(data[:daily][0..4])
    @hourly_weather = eight_hour_forecast(data[:hourly][0..7])
  end

  def five_day_forecast(data)
    data.map do |day|
      DailyForecast.new(day)
    end
  end

  def eight_hour_forecast(data)
    data.map do |hour|
      HourlyForecast.new(hour)
    end
  end
end
