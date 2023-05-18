Rails.application.routes.draw do
  resources :products
  root 'home#index'
  get 'sign_up', to: 'registration#index'
end
