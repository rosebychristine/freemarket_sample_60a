Rails.application.routes.draw do
  root 'signups#index'  
  get  'signups/index'  =>  'signups#index'
  get  'signups/edit' => 'signups#edit'
  get  'signups/edit2' => 'signups#edit2'
  get  'signups/edit3' => 'signups#edit3'
  get  'signups/edit4' => 'signups#edit4'
  get  'signups/edit5' => 'signups#edit5'
  end