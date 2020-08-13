Rails.application.routes.draw do

  patch "/posts/:id/favourite", to: "posts#favourite", as: :new_favourite_word

  # devise_for :users, :controllers => { :registrations => :registrations }

  resources :posts do 
    resources :comments
  end

  # get 'users/index'
  # get 'users/show'
  # get 'users/new'
  # get 'users/create'
  # get 'users/edit'
  # get 'users/update'
  # get 'users/destroy'
  get 'search', to: "posts#search"

  resources :categories
  devise_for :users
  resources :users
  resources :tags
 

  root "categories#index"

  # namespace :user do
  #     root :to => "users#show"
  # end

  # get '/user' => "users#index", :as => :user_root

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
