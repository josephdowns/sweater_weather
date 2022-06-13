class BackgroundImageSerializer
  def self.new(data)
    {
      "data": {
        "type": data.type,
        "id": data.id,
        "attributes": {
          "image_url": data.url,
          "description": data.description,
          "credit": {
            "user": data.user,
            "user_profile": data.user_profile
          }
        }
      }
    }
  end
end
