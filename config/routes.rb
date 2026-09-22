Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  authenticated :user do
    root to: "dashboard#index", as: :user_root
  end

  authenticated :admin do
    root to: "admin#index", as: :admin_root
  end

  root "dashboard#index"

  resources :transactions, except: :show
  resources :budgets, except: :show

  resources :pots, except: :show do
  resources :pot_transactions, only: %i[new create]
  end
  resources :recurring_bills, except: :show

  get "admin" => "admin#index"
end
