# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'V1::Employers', type: :request do
  describe 'GET /index without logging in' do
    it 'returns http unauthorized' do
      get '/api/v1/employers'
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/api/v1/employers/:id'
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'POST /create' do
    it 'returns http success' do
      post '/api/v1/employers'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT /update' do
    it 'returns http success' do
      put '/api/v1/employers/:id'
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'DELETE /destroy' do
    it 'returns http success' do
      delete '/api/v1/employers/:id'
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
