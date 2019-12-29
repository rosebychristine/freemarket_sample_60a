Rails.application.routes.draw do
  root 'signups#index'  
  get  'signups/index'  =>  'signups#index'
  end