# frozen_string_literal: true

module Api
  module V1
    class EmployerSerializer
      include JSONAPI::Serializer

      include AvatarHelper

      set_type :employer

      set_key_transform :camel_lower

      attributes :name, :email, :location

      attribute :tags, if: proc { |record|
                             record.tag.present?
                           } do |object|
        object.tag.content
      end

      attribute :postings do |object|
        object.postings.select(:id, :title, :status)
      end

      attribute :avatar do |object|
        avatar_url(object.email)
      end
    end
  end
end
