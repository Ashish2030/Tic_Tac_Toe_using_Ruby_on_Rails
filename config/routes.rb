Rails.application.routes.draw do

  resources :users  ,only: [:new,:create, :edit, :update, :show, :destroy]

  root to: 'sessions#new'
  post '/' => 'sessions#create'

  get 'sessions/logout'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  get 'a',to: 'sessions#text'
  get 'score/index'
  post '/played', to:'sessions#played'
end
