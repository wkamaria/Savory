Rails.application.routes.draw do
  resource :registration, only: %i[ new create ]
  resource :session
  resources :passwords, param: :token

  resources :recipes do
    member do
      post :toggle_favorite
    end
    resources :reviews, only: %i[ create destroy ]
  end

  resources :ingredients

  get "up" => "rails/health#show", as: :rails_health_check
  root "recipes#index"
end
