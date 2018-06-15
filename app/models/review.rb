class Review < ApplicationRecord
  belongs_to :user
  belongs_to :bird

  validates :title, presence: true, length: { minimum: 10, maximum: 100 }
  validates :content, presence: true, length: { minimum: 60, maximum: 600 }
end
