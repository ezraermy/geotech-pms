Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    resources :assignments
    resources :projects
    resources :users, only: [:create, :index]
  end
end

