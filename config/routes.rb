Feern::Application.routes.draw do
  devise_for :admins

  namespace :admin do
    resources :schedule, only: [:index] do
      post :refresh, on: :collection
    end

    resources :subscriptions
    root to: 'schedule#index'
  end

  resources :subscriptions, only: [:new, :create]
  match 'inscreva-se' => 'subscriptions#new'
  match 'progcompleta' => 'home#progcompleta'

  root to: 'home#index'
end
