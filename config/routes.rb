Rails.application.routes.draw do
  devise_for :users
  resources :products
  authenticate :user do
    root 'home#index'
    get '/catalog', to: 'catalog#index'
    get '/cart', to: 'cart#index'
    post '/cart/cart_item', to: 'cart#add_cart_item'
  end
end
