class Table < ApplicationRecord
  has_many :bookings

  enum type_table: {normal: 0, vip: 1}
  enum status: {disable: 0, setted: 1, vacant: 2}
  mount_uploader :image, ImageUploader
end
