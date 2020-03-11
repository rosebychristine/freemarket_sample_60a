
Rails.application.routes.draw do
  devise_for :users,
  # SNS認証
  controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }


  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
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
      get 'done'
      get 'login'
    end
  end


  resources :purchase, only: [:index] do
    collection do
      get 'done', to: 'purchase#done'
    end
    member do
     get 'index'
     get 'buy'
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