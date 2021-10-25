class Api::V1::TagSerializer
  include JSONAPI::Serializer
  
  attributes :content 
end
