Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  get "/user/home", to: "users#home"
  get "/current", to: "users#user"

  root "site#root"
end
