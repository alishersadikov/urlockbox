Rails.application.routes.draw do
  root to: "links#index"

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :links, only: [:index]
  resources :users, only: [:new, :create, :show]


  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
