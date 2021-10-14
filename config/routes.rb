Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :employers, only: [:create, :show, :update, :destroy]
      resources :workers, only: [:create, :show, :update, :destroy]

      resources :postings, only: [:index, :create, :show, :destroy]
      resources :applications, only: [:index, :create, :show, :destroy]
      
      resources :sessions, only: [:new, :create, :destroy]
    end
  end
end
