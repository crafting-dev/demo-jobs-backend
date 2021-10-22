# frozen_string_literal: true

class WorkerSerializer
  include JSONAPI::Serializer

  set_type :worker

  attributes :name, :email, :hourly_rate

  attribute :tags do |worker|
    worker.tags.pluck(:content).join(', ').split(', ')
  end

  attribute :applications do |worker|
    worker.applications.select(:id, :status, :posting_id, :created_at, :updated_at)
  end
end
