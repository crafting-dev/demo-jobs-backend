# frozen_string_literal: true

Rails.application.routes.draw do
  post   '/login_employer',  to: 'sessions#create_employer'
  delete '/logout_employer', to: 'sessions#destroy_employer'
  post   '/login_worker',    to: 'sessions#create_worker'
  delete '/logout_worker',   to: 'sessions#destroy_worker'

  scope :api do
    namespace :v1 do
      resources :employers, only: %i[create show update destroy]
      resources :workers,   only: %i[create show update destroy]
      resources :postings,  only: %i[index create show destroy]
      resources :apps,      only: %i[index create show destroy]
    end
  end
end
