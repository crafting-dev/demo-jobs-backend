# frozen_string_literal: true

module Api
  module V1
    class TagSerializer
      include JSONAPI::Serializer

      set_key_transform :camel_lower

      attributes :content
    end
  end
end
