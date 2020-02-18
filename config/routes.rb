
Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  devise_scope :user do 
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end
  resources :users do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
    end
  end

  resources :users, only: [:index,:edit]
  resources :items, only: [:new,:show,:update]
  resources :mypages, only: [:index,:profile,:show] 
end