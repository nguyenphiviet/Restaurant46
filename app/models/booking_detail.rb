class BookingDetail < ApplicationRecord
  belongs_to :dish
  belongs_to :booking

  scope :most_popular_dishes, ->{select(:dish_id).group(:dish_id).order("SUM(booking_details.quantity) DESC")}
end
