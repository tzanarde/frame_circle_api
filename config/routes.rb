Rails.application.routes.draw do
  # Swagger Routes
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  
  # Health Check Route
  get "up" => "rails/health#show", as: :rails_health_check

  # Resources Routes
  namespace :api do
    namespace :v1 do
      resources :frames, only: [:show, :create, :destroy] do
        resources :circles, only: :create
      end

      resources :circles, only: [:index, :update, :destroy]
    end
  end
end
