Rails.application.routes.draw do

  root 'sessions#home'
  resources :users  ,only: [:new,:create, :edit, :update, :show, :destroy]


  get 'login', to: 'sessions#new'
  get 'sessions/logout'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  get 'a',to: 'sessions#text'
  get 'score/index'
  post '/played', to:'sessions#played'
end
