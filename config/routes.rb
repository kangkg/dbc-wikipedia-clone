Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "categories#index"
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  delete '/logout' => 'sessions#destroy'
  delete '/favorites' => 'favorites#destroy'
  # post '/favorites' => 'favorites#create', as: 'favorite_create'
end
