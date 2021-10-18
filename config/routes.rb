# frozen_string_literal: true

Rails.application.routes.draw do
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  scope :api do
    namespace :v1 do
      resources :employers, only: %i[create show update destroy]
      resources :workers,   only: %i[create show update destroy]
      resources :postings,  only: %i[index create show destroy]
      resources :apps,      only: %i[index create show destroy]
    end
  end
end
