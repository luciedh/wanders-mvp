class PlacesController < ApplicationController
  def index
    if params[:query].present?
      @queries = params[:query].split(";")
      @queries_object = Category.where(name: @queries)
      @queries_id = []
      @queries_object.each do |object|
           @queries_id << object.id
      end
      @searched_places = Place.where(category: @queries_id)
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

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    @place.update(place_params)
    redirect_to place_path(@place)
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to places_path
  end

  private
  def place_params
    params.require(:place).permit(:fr_title, :address, :fr_description, :img_url, :category_id)
  end

end
