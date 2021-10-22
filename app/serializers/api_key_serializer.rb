# frozen_string_literal: true

class ApiKeySerializer
  include JSONAPI::Serializer

  attributes :token, &:token_digest
end
