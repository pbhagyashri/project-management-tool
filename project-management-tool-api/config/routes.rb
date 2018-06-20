Rails.application.routes.draw do
  namespace :api do
    resources :users, only: [:create, :index, :show] do
      resources :projects, only: [:index]
    end
    resources :projects

    post "/signup", to: "users#signup"
    post "/login", to: "sessions#login"
    get "/logout", to: "sessions#destroy"
  end
end
