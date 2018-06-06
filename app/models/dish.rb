class Dish < ApplicationRecord
  belongs_to :category
  has_many :images
  has_many :booking_details
  has_many :ratings
  has_many :reviews
end
