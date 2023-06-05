Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "main#index"
  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  get "logout", to: "sessions#destroy"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"

  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  get "dash", to: "admin#dash"
  get "dashboard", to: "users#dashboard"


  resources :artist_categories

  delete "/artist_categories/:id/destroy", to: "artist_categories#destroy", as: "artist_categories_del"

  resources :artists
  delete "/artists/:id", to: "artists#destroy", as: "artists_del"

  resources :artists do
    resources :reviews, only: [:new, :create, :edit, :update]
  end

  


  #get "/artists/:id/artist_email", to: "artists#artist_email", as: "artist_email"



  post "/artists/:id/send_notification_email", to: "artists#send_notification_email", as: "send_email"
  

end
