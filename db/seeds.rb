# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(user_name: 'admin', email: 'admin@example.com', password: '123456', password_confirmation: '123456', permission: 1) if Rails.env.development?
AdminUser.create!(user_name: 'framgia', email: 'admin@framgia.com', password: '123456', password_confirmation: '123456') if Rails.env.development?
