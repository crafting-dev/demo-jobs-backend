# frozen_string_literal: true

class TagSerializer
  include JSONAPI::Serializer

  attributes :content
end
