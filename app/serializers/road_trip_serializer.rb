class RoadTripSerializer
  def self.new(origin, destination, trip_time, forecast)
    {
      "data": {
        "id": nil,
        "type": "roadtrip",
        "attributes": {
          "start_city": origin,
          "end_city": destination,
          "travel_time": trip_time,
          "weather_at_eta": {
            "temperature": forecast.temperature,
            "conditions": forecast.conditions
          }
        }
      }
    }
  end
end
