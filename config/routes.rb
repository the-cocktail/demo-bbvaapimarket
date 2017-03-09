Rails.application.routes.draw do

  resources :accounts
  resources :cards
  resources :loans
  resources :me, only: [:index]
  resources :funnel, only: [:index]
  get 'funnel/buy_bbva', to: 'funnel#buy_bbva'
  get 'funnel/buy', to: 'funnel#buy'
  get '/me/samples', :to => 'me#samples'
  #BBVA Omniauth callback
  get '/auth/:bbva/callback', :to => 'sessions#create'
  get '/sessions/destroy'
  #Home
  root 'me#samples'

end
