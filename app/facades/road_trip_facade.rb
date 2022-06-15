class RoadTripFacade
  class << self
    def service
      MapquestService.new
    end

    def new_trip(origin, destination)
      trip = service.roadtrip(origin, destination)
      if trip[:info][:statuscode] == 402
        return "Error"
      else
        return trip[:route][:formattedTime]
      end
    end
  end
end
