# frozen_string_literal: true

module Api
  module V1
    class ApiKeysController < ApplicationController
      before_action :authenticate_by_key!, except: :create

      # POST /authenticate
      def create
        authenticate_with_http_basic do |email, password|
          employer = Employer.find_by email: email

          if employer&.authenticate(password)
            token = SecureRandom.hex
            api_key = employer.api_keys.create! token: token
            render_json ApiKey.new(id: api_key.id, token_digest: token), :created,
                        { params: { current_bearer: employer } }
            return
          end

          worker = Worker.find_by email: email

          if worker&.authenticate(password)
            token = SecureRandom.hex
            api_key = worker.api_keys.create! token: token
            render_json ApiKey.new(id: api_key.id, token_digest: token), :created,
                        { params: { current_bearer: worker } }
            return
          end
        end

        render status: :unauthorized
      end

      # DELETE /authenticate/:id
      def destroy
        api_key = current_bearer.api_keys.find(params[:id])
        api_key.destroy
        head :no_content
      end

      private

        # Set serializer for renderable
        def serializer
          ApiKeySerializer
        end
    end
  end
end
