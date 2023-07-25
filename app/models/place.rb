class Place < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :category
  has_many :favourite_places
  validates :fr_title, :fr_description, :address, :img_url, presence: true
  has_one_attached :photo
end
