class Dish < ApplicationRecord
  belongs_to :category
  has_many :images
  accepts_nested_attributes_for :images,
    reject_if: ->(attrs) {attrs["url"].blank?}
  has_many :booking_details
  has_many :ratings
  has_many :reviews

  scope :lastest, ->(number){order(created_at: :desc).limit(number).select(:id, :name, :price)}
  scope :most_popular_dishes,
    ->{where(id: BookingDetail.most_popular_dishes).limit(Settings.home.dish_popular_number)}
  scope :with_images, ->{includes :images}
  scope :newest, ->{order created_at: :desc}
  scope :oldest, ->{order created_at: :asc}
  scope :name_asc, ->{order name: :asc}
  scope :name_desc, ->{order name: :desc}
  scope :price_asc, ->{order price: :asc}
  scope :price_desc, ->{order price: :desc}
  scope :min_price, ->(min){where("price >= ?", min)}
  scope :max_price, ->(max){where("price <= ?", max)}
end

