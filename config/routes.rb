Rails.application.routes.draw do

  devise_for :users
  root "welcome#index"
  get "pages/about"
  get "pages/contact"
  get "pages/projects"
end
