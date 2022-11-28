# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'orders#new'

  resources :orders, only: %i[new create edit], param: :status_tracking_slug do
    member do
      post 'finalize', to: 'orders#finalize'
      get 'status', to: 'orders#status'
    end
  end

  resources :order_entries, only: %i[create destroy]

  namespace :admin do
    resources :orders, only: %i[index show] do
      member do
        post 'transition_in_progress', to: 'orders#transition_in_progress'
        post 'transition_completed', to: 'orders#transition_completed'
      end
    end
  end
end
