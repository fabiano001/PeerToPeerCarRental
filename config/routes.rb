Rails.application.routes.draw do
  devise_for :users,	path: '', path_names: {sign_in: 'login', sign_up: 'register', sign_out: 'logout'}
  root :to => 'pages#home'
  get '/' => 'pages#home'
  get '/:account' => 'pages#account'

end
