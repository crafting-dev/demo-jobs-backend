Rails.application.routes.draw do
  resources :employers, except: [:index]
  resources :workers, except: [:index]
  resources :postings, except: [:edit, :update]
end
