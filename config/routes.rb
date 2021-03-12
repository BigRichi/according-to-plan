Rails.application.routes.draw do
  
  root to: 'pages#home'

  get "/login", to: "users#login", as: "login"
  post "/handle_login", to: 'users#handle_login'
  
  delete "/logout", to: "users#logout"

  get "/all_events", to: "events#all_events", as: "all_events"
  resources :event_categories, only: [:create]
  resources :events, only: [:index, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:new, :create]
  resources :photos, only: [:index, :create, :destroy]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
