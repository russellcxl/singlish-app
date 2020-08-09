Rails.application.routes.draw do
  resources :posts

  resources :categories
  devise_for :users
  resources :users

  root "categories#index"

  # namespace :user do
  #     root :to => "users#show"
  # end

  # get '/user' => "users#index", :as => :user_root

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
