# frozen_string_literal: true

module Api
  module V1
    class ApiKeySerializer
      include JSONAPI::Serializer

      include AvatarHelper

      set_type :api_key

      set_key_transform :camel_lower

      attribute :token, &:token_digest

      attribute :bearer do |_object, params|
        {
          id: params[:current_bearer].id,
          name: params[:current_bearer].name,
          email: params[:current_bearer].email,
          type: params[:current_bearer].class.name,
          avatar: avatar_url(params[:current_bearer].email)
        }
      end
    end
  end
end
