Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get 'mypage/profile' => 'mypage#profile'

Rails.application.routes.draw do  
  resources :signups, only: [:index, :create] do
    collection do
      get 'member_info'
      get 'phone_number'
      get 'phone_number_conf'
      get 'postal_code'
      get 'credit'
      get 'ready'
    end
  end

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
  
  root "mypage#index"
  resources :logoutpages, only: [:index]
  resources :creditpages, only: [:index]
end

