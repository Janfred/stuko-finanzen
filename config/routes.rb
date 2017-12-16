Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "shibboleth" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :budget_years
  resources :meetings
  resources :financial_requests
  resources :bookings
  resources :users, except: [:new, :create]

  root "budget_years#index"
end
