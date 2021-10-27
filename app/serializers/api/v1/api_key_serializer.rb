# frozen_string_literal: true

module Api
  module V1
    class ApiKeySerializer
      include JSONAPI::Serializer

      set_type :api_key

      attribute :token, &:token_digest

      attribute :bearer do |_object, params|
        {
          id: params[:current_bearer].id,
          name: params[:current_bearer].name,
          email: params[:current_bearer].email,
          type: params[:current_bearer].class.name
        }
      end
    end
  end
end
