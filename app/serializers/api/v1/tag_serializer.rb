# frozen_string_literal: true

module Api
  module V1
    class TagSerializer
      include JSONAPI::Serializer

      attributes :content
    end
  end
end
