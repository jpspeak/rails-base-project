Rails.application.routes.draw do
  scope :buyer do
    root "buyers/home#index", as: 'buyer_root'
  end
  scope :broker do
    root "brokers/home#index", as: 'broker_root'
  end
  scope :admin do
    root "admins/home#index", as: 'admin_root'
  end
  devise_for :buyers, controllers: { sessions: 'buyers/sessions', registrations: 'buyers/registrations'}
  devise_for :brokers, controllers: { sessions: 'brokers/sessions', registrations: 'brokers/registrations'}
  devise_for :admins, controllers: { sessions: 'admins/sessions', registrations: 'admins/registrations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "home/homepage"
  root "home#homepage"
end
