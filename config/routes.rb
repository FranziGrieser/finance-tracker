Rails.application.routes.draw do

  devise_for :users
  root "welcome#index"
  get "pages/about"
  get "pages/contact"
  get "pages/projects"
  get "my_portfolio", to: "users#my_portfolio"
  get "search_stocks", to: "stocks#search"
  resources :user_stocks, only: [:create]
end
