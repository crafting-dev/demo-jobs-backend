Rails.application.routes.draw do
  resources :employers, except: [:index]
end
