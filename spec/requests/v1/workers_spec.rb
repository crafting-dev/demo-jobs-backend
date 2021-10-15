# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'V1::Workers', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/v1/workers/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/v1/workers/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/v1/workers/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/v1/workers/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get '/v1/workers/edit'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /update' do
    it 'returns http success' do
      get '/v1/workers/update'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      get '/v1/workers/destroy'
      expect(response).to have_http_status(:success)
    end
  end
end
