RottenMangoes::Application.routes.draw do

  get 'reviews/new'

  get 'reviews/create'

  resources :movies do
        resources :reviews, only: [:new, :create]
  end
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  namespace :admin do
    resources :users, only: [:index, :destroy, :update, :edit]
  end

  get '/search' => "movies#index" 

  root to: 'movies#index'
  
end
