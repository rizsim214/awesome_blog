Rails.application.routes.draw do
  root 'static_pages#home'
  
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signin' , to: 'sessions#new'
  get '/signup' , to: 'users#new'

  delete '/logout', to: 'sessions#destroy'
  resources :users, except: :new
  resources :sessions, only: :create 
  resources :microposts, only: [:create , :destroy]
  resources :relationships, only: [:create , :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
