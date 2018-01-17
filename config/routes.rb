Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "shibboleth" }
  localized do
    resources :budget_years
    resources :meetings
    resources :financial_requests
    get 'not_called', to: 'financial_requests#not_called'
    resources :bookings
    resources :users, except: [:new, :create]
  end

  root "welcome#index"
end
