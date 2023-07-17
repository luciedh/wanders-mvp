class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.string :fr_title
      t.text :fr_description
      t.string :eng_title
      t.text :eng_description
      t.string :address
      t.float :geo_lat
      t.float :geo_long
      t.string :post_code
      t.string :img_url
      t.string :audio_url
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
