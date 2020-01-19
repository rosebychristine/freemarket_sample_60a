Rails.application.routes.draw do
  root "mypage#index"
  resources :logoutpages, only: [:index]
end
