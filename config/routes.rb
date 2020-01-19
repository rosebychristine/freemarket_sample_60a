Rails.application.routes.draw do
  root "mypage#index"
  get "logoutpages" => "logoutpages#index"
end
