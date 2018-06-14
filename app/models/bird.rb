class Bird < ApplicationRecord
  belongs_to :user
  has_many :rentals

  validates :user, presence: true
  validates :name, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :description, presence: true, length: { minimum: 140, maximum: 800 }

  include PgSearch
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }
end
