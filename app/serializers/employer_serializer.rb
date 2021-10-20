# frozen_string_literal: true

class EmployerSerializer
  include JSONAPI::Serializer

  attributes :name, :email, :location
  has_many :postings
  has_many :tags, polymorphic: true
  has_many :api_keys
end
