# frozen_string_literal: true

class ApplicationSerializer
  include JSONAPI::Serializer

  attributes :content, :status
  has_many :tags
  belongs_to :posting
  belongs_to :worker
end
