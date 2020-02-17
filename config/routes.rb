Rails.application.routes.draw do
  root "items#index"
  resources :users, only: [:new,:create,:show] do
    collection do
      get 'member_info'
      get 'phone_number'
      get 'phone_number_conf'
      get 'postal_code'
      get 'credit'
    end
  end

  resources :items, only: [:index, :new, :edit, :show]
  resources :mypages, only: [:index,:edit,:update,:destroy] do
    collection do
      get 'login'
    end
  end
end
