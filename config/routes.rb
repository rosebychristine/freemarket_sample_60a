Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :edit]
  resources :items, only: [:index, :create, :show]
  resources :mypages, only: [:index,:profile] 
end