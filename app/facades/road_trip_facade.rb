class RoadTripFacade
  class << self
    def service
      MapquestService.new
    end

    def new_trip(origin, destination)
      trip = service.roadtrip(origin, destination)
      trip[:route][:formattedTime]
    end
  end
end
