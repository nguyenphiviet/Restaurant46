class Category < ApplicationRecord
  has_many :dishes

  scope :ordered_by_name, ->(keyword = :asc){order name: keyword}

  validates :name, presence: true, length: {maximum: 50}
end
