class Review < ApplicationRecord
  belongs_to :user
  belongs_to :bird

  validates :title, presence: true, length: { minimum: 5, maximum: 200 }
  validates :content, presence: true, length: { minimum: 10, maximum: 600 }
end
