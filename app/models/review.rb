class Review < ApplicationRecord
  belongs_to :admin_user
  belongs_to :dish
end
