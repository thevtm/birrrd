class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :rentals

  has_many :birds_for_rent, class_name: "Bird", foreign_key: "user_id"
  has_many :birds_renting, through: :rentals, source: :bird

  validates :name, presence: true
end
