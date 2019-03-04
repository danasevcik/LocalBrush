Rails.application.routes.draw do
  get '/', to: 'login#home', as: 'homepage'
  get '/painterlogin', to: 'painters#login', as: 'painter_login'
  get '/userlogin', to: 'users#login', as: 'user_login'

  resources :reviews
  resources :projects
  resources :rooms
  resources :painters
  resources :users

  # get '/users/:id/new_room', to: 'rooms#new', as: 'new_user_room'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
