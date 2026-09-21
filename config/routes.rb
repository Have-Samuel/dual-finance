Rails.application.routes.draw do
  get "recurring_bills/index"
  get "recurring_bills/new"
  get "recurring_bills/create"
  get "recurring_bills/edit"
  get "recurring_bills/update"
  get "recurring_bills/destroy"
  get "pot_transactions/index"
  get "pot_transactions/new"
  get "pot_transactions/create"
  get "pots/index"
  get "pots/new"
  get "pots/create"
  get "pots/edit"
  get "pots/update"
  get "pots/destroy"
  get "budgets/index"
  get "budgets/new"
  get "budgets/create"
  get "budgets/edit"
  get "budgets/update"
  get "budgets/destroy"
  get "transactions/index"
  get "transactions/new"
  get "transactions/create"
  get "transactions/edit"
  get "transactions/update"
  get "transactions/destroy"
  get "dashboard/index"
  devise_for :users
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
