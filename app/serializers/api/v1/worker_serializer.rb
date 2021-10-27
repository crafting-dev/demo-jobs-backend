# frozen_string_literal: true

module Api
  module V1
    class WorkerSerializer
      include JSONAPI::Serializer

      include AvatarHelper

      set_type :worker

      set_key_transform :camel_lower

      attributes :name, :email, :hourly_rate

      attribute :tags, if: proc { |record|
                             record.tag.present?
                           } do |object|
        object.tag.content
      end

      attribute :applications, if: proc { |record, params|
                                     params[:current_bearer].instance_of?(Worker) && params[:current_bearer].id == record.id
                                   } do |object|
        object.applications.joins(:posting).select(:id, 'postings.title', :status)
      end

      attribute :avatar do |object|
        avatar_url(object.email)
      end
    end
  end
end
