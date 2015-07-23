Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :experiences, only: [:create, :destroy], defaults: {format: :json}
  resources :educations, only: [:create, :destroy, :update], defaults: {format: :json}
  get "/site", to: "users#home"
  get "/current", to: "users#user", defaults: {format: :json}
  get "/user/:id", to: "users#profile_user", defaults: {format: :json}
  get "/randomusers", to: "users#random_users"
  get "/guestuser", to: "users#make_guest_user"
  put "/current", to: "users#update_current"
  put "/experiences/:id", to: "experiences#edit"
  post "request/:id", to: "requests#create"
  post "/request/destroy/:senderid/:responderid", to: "requests#destroy"
  post "/connections/:id1/:id2", to: "connections#create"
  get "/deleteallguests", to: "users#delete_all_guests"

  get "/auth/:provider/callback", to: "sessions#omniauth"
  root "site#root"
end
