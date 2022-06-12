class MapquestFacade
  class << self
    def service
      MapquestService.new
    end

    def get_geocode(address)
      location = service.address_to_geocode(address)
      Geocode.new(location[:results][0][:locations][0][:latLng])
    end
  end
end
