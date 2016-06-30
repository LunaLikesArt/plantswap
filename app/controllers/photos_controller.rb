class PhotosController < ApplicationController

  def new
    @photo = Photo.new
  end

  def create
    @plant = Plant.find(params[:plant_id])
    @plant.photos.create(photo_params)
    redirect_to plant_path(@plant)
  end


  private

  def photo_params
    params.require(:photo).permit(:picture, :caption)
  end

end
