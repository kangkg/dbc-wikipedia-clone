Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "categories#index"
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]

  resources :articles, only: [:index, :new, :create, :destroy, :show, :update] do
    resources :revisions
  end

  resources :categories # not sure if we should allow routes for this.


  delete '/logout' => 'sessions#destroy'
  delete '/favorites' => 'favorites#destroy'
  # post '/favorites' => 'favorites#create', as: 'favorite_create'
end
