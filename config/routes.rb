Rails.application.routes.draw do
  root "dashboard#index"
  
  get "dashboard", to: "dashboard#index"
  resources :properties, only: [:index, :show]
  resources :maintenance_tickets, only: [:index, :create]
  resources :opportunities, only: [:index, :show]
  
  get "up" => "rails/health#show", as: :rails_health_check
end
