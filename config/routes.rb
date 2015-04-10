Rails.application.routes.draw do
  root "static_pages#home" 

  get "help"    => "static_pages#help"
  get "about"   => "static_pages#about"
  get "contact" => "static_pages#contact"

  devise_for :users
  resources :users
  resources :books do
    resources :reviews, except: [:index]
  end
  resources :users do
    resources :libraries, only: [:index]
  end
  resources :categories
  resources :libraries, only: [:create, :destroy]
  get '/users/:id/:show_type' => 'users#show'
  resources :relationships, only: [:create, :destroy]
end
