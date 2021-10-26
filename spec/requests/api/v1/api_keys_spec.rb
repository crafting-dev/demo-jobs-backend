# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::ApiKeys', type: :request do
  before(:all) do
    @user = create(:employer)
  end

  describe 'POST /authenticate' do
    it 'authenticates the user' do
      post '/api/v1/authenticate', params: { email: @user.email, password: @user.password }
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'DELETE /authenticate/:id' do
  end
end
