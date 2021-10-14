Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :employers, except: [:index]
      resources :workers, except: [:index]
      resources :postings, except: [:edit, :update]
      resources :applications
      resources :sessions, only: [:new, :create, :destroy]
    end
  end
end
