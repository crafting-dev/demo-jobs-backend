# frozen_string_literal: true

class PostingSerializer
  include JSONAPI::Serializer

  set_type :posting

  attributes :title, :hours, :status

  attribute :tags do |posting|
    posting.tags.pluck(:content).join(', ').split(', ')
  end

  attribute :employer do |posting|
    {
      id: posting.employer.id,
      name: posting.employer.name,
      email: posting.employer.email
    }
  end

  ### FIXME
  attribute :description
  has_many :applications
end
