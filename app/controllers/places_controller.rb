class PlacesController < ApplicationController
  def index
    if params[:query].present?
      @queries = params[:query].split(";")
      @searched_places = Place.where(category: @queries)
    else
      @searched_places = Place.all
    end

    @markers = @searched_places.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude
      }
    end
  end

  def show
    @place = Place.find(params[:id])
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.save
    redirect_to place_path(@place)
  end

  private
  def place_params
    params.require(:place).permit(:fr_title, :address, :fr_description)
  end

end
