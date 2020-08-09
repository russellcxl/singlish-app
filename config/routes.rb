Rails.application.routes.draw do
  # get 'comments/index'
  # get 'comments/show'
  # get 'comments/new'
  # get 'comments/create'
  # get 'comments/edit'
  # get 'comments/update'
  # get 'comments/destroy'
  # get 'users/index'
  # get 'users/show'
  # get 'users/new'
  # get 'users/create'
  # get 'users/edit'
  # get 'users/update'
  # get 'users/destroy'

  
  devise_for :users
  resources :users
  resources :comments

  root "users#index"

  # namespace :user do
  #     root :to => "users#show"
  # end

  # get '/user' => "users#index", :as => :user_root

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
