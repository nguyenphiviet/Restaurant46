class AdminUser < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable,
    authentication_keys: [:user_name]

  enum permission: {manager: 0, admin: 1}
end
