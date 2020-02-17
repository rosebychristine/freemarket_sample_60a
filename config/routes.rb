
Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  }
  devise_scope :user do 
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end
  resources :users, only: [:index, :edit]
  resources :items, only: [:index, :create, :show]
  resources :mypages, only: [:index,:profile] 
end
#   resources :users, only: [:index, :create, :edit, :update, :show]
#   resources :items, only: [:index, :create, :edit, :update, :show]
# end
  
#   resources :sells, only: [:new]

#   resources :logins, only: [:index, :new] do
#     collection do
#       get 'login'
#       get 'new'
#     end
#   end

#   resources :sells, only: [:purchase] do
#     collection do
#       get 'buy_conf'
#     end
#   end
  
#   root "mypages#edit"
#   resources :logoutpages, only: [:index]
#   resources :creditpages, only: [:index]
#   resources :products_details, only: [:show]
#   resources :tops, only: [:index]

#   resources :mypages, only: [:index,:profile] do
#     collection do
#       get 'mypage'
#       get 'index'
#       get 'profile'
#     end
#   end
# end