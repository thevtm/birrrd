class Rental < ApplicationRecord
  enum status: { pending: 0, confirmed: 1, reject: 2 }

  belongs_to :bird
  belongs_to :user

  validates :user, presence: true
  validates :bird, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true
end
