Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :signup, only: [:index, :create] do
    collection do
      get 'registration'
    end
  end
end
