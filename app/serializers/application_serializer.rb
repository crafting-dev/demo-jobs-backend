# frozen_string_literal: true

class ApplicationSerializer
  include JSONAPI::Serializer

  set_type :application

  attributes :content, :status

  attribute :tags do |application|
    application.tags.pluck(:content).join(', ').split(', ')
  end

  ### FIXME
  belongs_to :posting
  belongs_to :worker
end
