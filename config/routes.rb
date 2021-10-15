# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :employers, only: %i[create show update destroy]
      resources :workers,   only: %i[create show update destroy]
      resources :postings,  only: %i[index create show destroy]
    end
  end
end
