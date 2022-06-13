class BackgroundsFacade
  class << self
    def service
      BackgroundsService.new
    end

    def get_photo(location)
      background_photo = service.get_data(location)[:results].first
      BackgroundImage.new(background_photo)
    end
  end
end
