Feern::Application.routes.draw do
  devise_for :admins

  namespace :admin do
    resources :schedule, only: [:index] do
      post :refresh, on: :collection
    end

    root to: 'schedule#index'
  end
end
