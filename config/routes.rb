Rails.application.routes.draw do
  resources :rentals
  resources :chats
  resources :messages
  resources :reviews
  resources :car_pictures
  resources :cars
  devise_for :users,	path: '', path_names: {sign_in: 'login', sign_up: 'register', sign_out: 'logout'}
  root :to => 'pages#home'
  get '/' => 'pages#home'
  get '/account' => 'pages#account'
  get '/search' => 'pages#search', as: :car_search

end
