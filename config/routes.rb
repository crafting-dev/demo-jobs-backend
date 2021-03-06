# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    get 'status', to: 'status#show'
    # API version v1
    namespace :v1 do
      # Authentication
      resources :api_keys, path: 'authenticate', only: %i[create destroy]

      # Employers
      resources :employers, only: %i[show create update destroy]

      # Workers
      resources :workers, only: %i[show create update destroy]

      # Postings
      resources :postings, only: %i[index show create update destroy]

      # Applications
      resources :applications, only: %i[index show create update destroy]
    end
  end
end
