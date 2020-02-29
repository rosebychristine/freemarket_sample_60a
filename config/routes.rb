
Rails.application.routes.draw do
  devise_for :users,
  # SNS認証
  controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root 'items#index'
  resources :users, only: [:index,:edit]
  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
      get 'step5'
      get 'done'
    end
  end
  resources :items, only: [:index,:create,:edit,:show,:new,:update,:destroy]
  resources :mypages, only: [:index,:edit] 
end