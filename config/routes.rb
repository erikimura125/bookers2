Rails.application.routes.draw do
  resource :users, only: [:edit]
  resources :books, only: [:new, :create, :index, :show, :edit]
  devise_for :users
  root to: "homes#top"
  get "/homes/about" => "homes#about", as: "about"
  get "/homes/index" => "homes#index", as: "index"
  post "/homes/index" => "homes#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
