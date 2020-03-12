
Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  get 'purchase/index'
  get 'purchase/done'
  devise_for :users,
  # SNS認証
  controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }


  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  root 'items#index'
  resources :users, only: [:index,:edit]

  resources :signup do
    collection do
      get 'step0'
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
      get 'credit'
      get 'done'
      get 'login'
    end
  end


  resources :purchase, only: [:index] do
    member do
      get 'index'
      get 'pay'
      get 'purchase_conf'
      get 'done'
    end
  end


  resources :items, only: [:index,:create,:edit,:show,:new,:update,:destroy] do
    collection do
      post 'purchase'
    end
  end
  


  resources :mypages, only: [:index,:edit] do
    collection do
      get 'identification'
      get 'credit'
    end
  end
end