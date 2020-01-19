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
  root "mypage#index"
end

