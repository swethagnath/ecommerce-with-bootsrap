Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  post '/products/index'
  get '/wishlists/check'
  get '/categories/check_category'
  get '/products/limited'
  resources :coupons
  resources :brands
  devise_for :users
  resources:reviews
  resources:cart_line_items
  resources:categories
  resources:products do 
    member do 
      get 'limited'
    end
  end
  resources:wishlists
  resources:addresses
  resources:orders
  get 'say/hello'
  root 'products#index'
  get 'say/goodbye'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
