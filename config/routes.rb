Rails.application.routes.draw do
  resources :coupons
  resources :brands
  devise_for :users
  resources:reviews
  resources:cart_line_items
  resources:categories
  resources:products
  resources:wishlists
  resources:addresses
  resources:orders
  get 'say/hello'
  root 'products#index'
  get 'say/goodbye'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
