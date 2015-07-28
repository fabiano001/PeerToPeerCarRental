Rails.application.routes.draw do 
 get '/' => 'pages#home'
 get '/login' => 'pages#login'
end
