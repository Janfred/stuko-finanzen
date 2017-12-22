Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "shibboleth" }
  localized do
    resources :budget_years
    resources :meetings
    resources :financial_requests
    resources :bookings
    resources :users, except: [:new, :create]
  end

  root "budget_years#index"
end
