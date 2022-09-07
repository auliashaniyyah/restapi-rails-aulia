Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end
  
  namespace :api do
    resources :users, only: %i[create index]
    resources :bookmarks
    resources :testings
    resources :barangs
    resources :orders
    resources :products
    resources :customers
    resources :order_details
  end

  
end