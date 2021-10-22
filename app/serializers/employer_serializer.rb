# frozen_string_literal: true

class EmployerSerializer
  include JSONAPI::Serializer

  set_type :employer

  attributes :name, :email, :location

  attribute :tags do |employer|
    employer.tags.pluck(:content).join(', ').split(', ')
  end

  attribute :postings do |employer|
    employer.postings.select(:id, :title, :hours, :status, :created_at, :updated_at)
  end
end
