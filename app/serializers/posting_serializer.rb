# frozen_string_literal: true

class PostingSerializer
  include JSONAPI::Serializer

  attributes :title, :description, :hours, :status
  has_many :applications
  has_many :tags
  belongs_to :employer
end
