Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :connections, only: [:create, :destroy]
  get "/user/home", to: "users#home"
  get "/current", to: "users#user", defaults: {format: :json}
  get "/user/:id", to: "users#profile_user", defaults: {format: :json}
  put "/current", to: "users#update_current"
  post "request/:id", to: "requests#create"
  post "/request/destroy/:senderid/:responderid", to: "requests#destroy"
  root "site#root"
end
