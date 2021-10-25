# frozen_string_literal: true

module Api
  module V1
    class ApiKeySerializer
      include JSONAPI::Serializer

      attributes :token, &:token_digest
    end
  end
end
