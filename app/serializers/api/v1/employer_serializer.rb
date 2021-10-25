# frozen_string_literal: true

module Api
  module V1
    class EmployerSerializer
      include JSONAPI::Serializer

      set_type :employer

      attributes :name, :email, :location

      attribute :tags, if: proc { |record|
                             record.tag.present?
                           } do |object|
        object.tag.content
      end

      attribute :postings do |object|
        object.postings.select(:id, :title, :status)
      end
    end
  end
end
