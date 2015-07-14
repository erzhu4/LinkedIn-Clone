Rails.application.routes.draw do
  resources :users, only: [:new, :create, :update, :show]
  resource :session, only: [:new, :create, :destroy]
  get "/user/home", to: "users#home"
  get "/current", to: "users#user", defaults: {format: :json}

  root "site#root"
end
