Rails.application.routes.draw do

  resources :accounts
  resources :cards
  resources :me, only: [:index]
  get '/me/samples', :to => 'me#samples'
  #BBVA Omniauth callback
  get '/auth/:bbva/callback', :to => 'sessions#create'
  get '/sessions/destroy'
  #Home
  root 'me#samples'

end
