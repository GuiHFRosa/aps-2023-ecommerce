Rails.application.routes.draw do
  devise_for :users
  resources :products
  root 'home#index'
  get '/catalog', to: 'catalog#index'
  authenticate :user do
    get '/cart', to: 'cart#index'
    post '/cart/cart_item', to: 'cart#add_cart_item'
    post '/cart/cart_item/show', to: 'cart#add_cart_item_show'
    delete '/cart/cart_item/:id', to: 'cart#remove_cart_item', as: "remove_cart_item"
  end
end
