class AdminUser < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable,
    authentication_keys: [:user_name]
  has_many :reviews

  enum permission: {manager: 0, admin: 1}
end
