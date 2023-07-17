class RemoveCoordinatesFromPlaces < ActiveRecord::Migration[7.0]
  def change
    remove_column :places, :geo_lat, :float
    remove_column :places, :geo_long, :float
  end
end
