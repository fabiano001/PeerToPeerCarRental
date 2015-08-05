Rails.application.routes.draw do
  resources :caches
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :rentals
  resources :chats
  resources :messages
  resources :reviews
  
  resources :cars do 
    resources :pictures
    end

  devise_for :users,	path: '', path_names: {sign_in: 'login', sign_up: 'register', sign_out: 'logout'}
  root :to => 'pages#home'
  get '/' => 'pages#home', as: :home
  get '/account' => 'pages#account'
  get '/search' => 'pages#search', as: :car_search
  post '/search' => 'pages#search_results_api'
  post '/cache-users-search' => 'pages#cache_search_results_api'
  get '/rent-confirmation' => 'pages#rent_confirmation', as: :rent_car
  post '/redirect/:type' => 'pages#redirect'

end

