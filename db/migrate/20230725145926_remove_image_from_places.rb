class RemoveImageFromPlaces < ActiveRecord::Migration[7.0]
  def change
    remove_column :places, :img_url, :string
  end
end
