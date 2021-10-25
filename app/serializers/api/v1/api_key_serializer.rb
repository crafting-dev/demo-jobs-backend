class Api::V1::ApiKeySerializer
  include JSONAPI::Serializer
  
  attributes :token, &:token_digest 
end
