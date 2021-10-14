Rails.application.routes.draw do
  resources :employers, except: [:index]
  resources :workers, except: [:index]
end
