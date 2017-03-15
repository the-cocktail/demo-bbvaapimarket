Rails.application.routes.draw do

  resources :accounts
  resources :cards
  resources :loans
  resources :me, only: [:index]
  resources :funnel, only: [:index]
  get 'funnel/buy_bbva', to: 'funnel#buy_bbva'
  get 'funnel/buy', to: 'funnel#buy'
  get 'funnel/payment/:id', to: 'funnel#payment', as: :payment
  post 'funnel/transfer/:id', to: 'funnel#transfer', as: :transfer
  get 'funnel/transfer_back_url', to: 'funnel#transfer_back_url', as: :transfer_back_url
  get '/me/samples', :to => 'me#samples'
  #BBVA Omniauth callback
  get '/auth/:bbva/callback', :to => 'sessions#create'
  get '/sessions/destroy'
  #Home
  root 'me#samples'

end
