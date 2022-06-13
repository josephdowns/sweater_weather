class BackgroundImage
  attr_reader :id, :url, :description, :type, :user, :user_profile

  def initialize(data)
    @id = data[:id]
    @url = data[:urls][:regular]
    @description = data[:alt_description]
    @type = 'image'
    @user = data[:user][:name]
    @user_profile = data[:user][:links][:portfolio]
  end
end
