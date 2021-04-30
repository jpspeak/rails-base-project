Rails.application.routes.draw do

  root "welcome#index"

  scope :buyer do
    root 'buyers/home#index', as: 'buyer_root'
    get 'brokers', to: 'buyers/brokers#index'
    get 'brokers/:id/stocks', to: 'buyers/brokers#show', as: 'broker'
    get 'stocks/:id', to: 'buyers/stocks#show', as: 'stock'
    post 'stock/:id/buy', to: 'buyers/stocks#buy', as: 'buy_stock'
    get 'transactions', to: 'buyers/transactions#index', as: 'transactions'
    resources :transactions, as: 'buyer_transaction', controller: 'buyers/transactions', only: [:index]
  end

  scope :broker do
    root 'brokers/home#index', as: 'broker_root'
    resource :stocks, controller: 'brokers/stocks'
    get 'transactions', to: 'brokers/transactions#index', as: 'broker_transactions'
    get 'stocks/search', to: 'brokers/stocks#search' 
  end

  scope :admin do
    root 'admins/home#index', as: 'admin_root'
    resources :buyers, controller: 'admins/buyers'
    resources :brokers, as: 'admin_brokers', controller: 'admins/brokers'
    get 'transactions', to: 'admins/transactions#index', as: 'admin_transactions'
    get 'pending_registrations', to: 'admins/broker_pending_registrations#index', as: 'admin_broker_pending_registrations'
    post 'pending_registrations/:id/approve', to: 'admins/broker_pending_registrations#approve', as: 'admin_broker_approve'
  end

  devise_for :buyers, controllers: { sessions: 'buyers/sessions', registrations: 'buyers/registrations'}
  devise_for :brokers, controllers: { sessions: 'brokers/sessions', registrations: 'brokers/registrations'}
  devise_for :admins, skip: [:registrations], controllers: { sessions: 'admins/sessions', registrations: 'admins/registrations'}
  
end
