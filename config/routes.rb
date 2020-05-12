Rails.application.routes.draw do
  root 'members#index'
  get '/signup', to: 'members#new'
  resources :members
  resources :posts
end
