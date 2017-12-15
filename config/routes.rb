Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "shibboleth" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :budget_years
  resources :meetings
  resources :financial_requests
  resources :bookings

  root "budget_years#index"
end
