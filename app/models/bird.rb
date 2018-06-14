class Bird < ApplicationRecord
  belongs_to :user
  has_many :rentals

  validates :user, presence: true
  validates :name, presence: true
  validates :location, presence: true
  validates :price, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
