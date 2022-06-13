class Api::V1::BackgroundsController < ApplicationController
  def index
    image = BackgroundsFacade.get_photo(params[:location])
    render json: BackgroundImageSerializer.new(image)
  end
end
