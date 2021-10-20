# frozen_string_literal: true

class WorkerSerializer
  include JSONAPI::Serializer

  attributes :name, :email, :hourly_rate
  has_many :applications
  has_many :tags
  has_many :api_keys
end
