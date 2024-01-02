Rails.application.routes.draw do
  root to: redirect('/lists')

  resources :users, only: [:create]

  get '/signup', to: 'users#new'
  delete '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'

  resources :lists do
    resources :items, only: %i[update create destroy]
  end
end
