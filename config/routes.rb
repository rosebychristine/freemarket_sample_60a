Rails.application.routes.draw do  
  devise_for :users
  resources :signups, only: [:index, :create] do
    collection do
      get 'member_info',to: 'signups#member_info'
      get 'phone_number',to: 'signups#phone_number'
      get 'phone_number_conf'
      get 'postal_code'
      get 'credit'
      get 'ready'
    end
  end
  
  resources :sells, only: [:new]

  resources :logins, only: [:index, :new] do
    collection do
      get 'login'
      get 'new'
    end
  end

  resources :sells, only: [:purchase] do
    collection do
      get 'buy_conf'
    end
  end
  
  root "mypages#index"
  resources :logoutpages, only: [:index]
  resources :creditpages, only: [:index]
  resources :product_detail, only: [:show]
  resources :tops, only: [:index]

  resources :mypages, only: [:index,:profile] do
    collection do
      get 'mypage'
      get 'index'
      get 'profile'
    end
  end
end