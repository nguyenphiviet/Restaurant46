Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "home#index"
  get "/contact", to: "home#contact"
  post "/contact", to: "home#send_contact"
  devise_for :users, path: "", path_names: {sign_in: "login",
    sign_out: "logout", sign_up: "signup", edit: "profile"}
  resources :tables
  resources :dishes
  resources :bookings
  resources :categories
  resources :reservations
  resources :booking_details
  resources :carts
end
