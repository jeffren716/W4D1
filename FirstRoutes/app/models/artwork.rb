class Artwork < ApplicationRecord
  validates :title, :image_url, :artist_id, presence: true

  has_many :shares,
  primary_key: :id,
  foreign_key: :artwork_id,
  class_name: 'ArtworkShare'

  has_many :shared_viewers,
  through: :shares,
  source: :viewer
end
