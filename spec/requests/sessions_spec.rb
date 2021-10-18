# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  describe 'POST /login/employer' do
    it 'returns http success' do
      post '/login/employer'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE /logout/employer' do
    it 'returns http success' do
      delete '/logout/employer'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /login_worker' do
    it 'returns http success' do
      get '/sessions/create_worker'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /logout_worker' do
    it 'returns http success' do
      get '/sessions/destroy_worker'
      expect(response).to have_http_status(:success)
    end
  end
end
