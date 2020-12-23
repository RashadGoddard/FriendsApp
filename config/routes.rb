Rails.application.routes.draw do
  devise_for :models
  #devise_for :users
  #devise_for :installs
  resources :friends
  get 'home/about'
  get 'home/index'
  root 'friends#index'
  #root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
