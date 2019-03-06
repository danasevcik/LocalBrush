Rails.application.routes.draw do
  root 'login#home', as: 'homepage'
  # root :to => "login#home"
  get '/painterlogin', to: 'painterlogin#login', as: 'painter_login'
  get '/userlogin', to: 'userlogin#login', as: 'user_login'
  post '/painterlogin', to: 'painterlogin#create'
  post '/userlogin', to: 'userlogin#create'
  get '/my_painters', to: 'users#mypainters', as: 'my_painters'
  get '/my_rooms', to: 'users#myroom', as: 'my_rooms'
  # get '/new_review', to: 'users#review', as: 'new_review'
  # get '/painter_logout', to: 'painters#logout', as: 'painter_logout'
  resources :reviews
  resources :projects
  resources :rooms
  resources :painters
  resources :users

  # get '/users/:id/new_room', to: 'rooms#new', as: 'new_user_room'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
