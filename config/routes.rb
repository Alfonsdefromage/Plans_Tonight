Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users, only: [:show, :index]

  resources :plans, only: [:show, :index, :create, :new, :post, :update] do
    member do
      get 'invitation'
      post 'invite'
      patch 'mark_as_done'
      patch 'mark_as_pending'
      patch 'mark_as_past'
    end
    resources :polls, only: [:new, :create]
  end

  resources :polls, only: [:edit, :show]

  resources :bars, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
