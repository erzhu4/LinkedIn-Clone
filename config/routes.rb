Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  get "/user/home", to: "users#home"
  get "/current", to: "users#user", defaults: {format: :json}
  put "/current", to: "users#update_current"

  root "site#root"
end
