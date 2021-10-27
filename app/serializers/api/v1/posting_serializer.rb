# frozen_string_literal: true

module Api
  module V1
    class PostingSerializer
      include JSONAPI::Serializer

      set_type :posting

      set_key_transform :camel_lower

      attributes :title, :hours, :status, :description, :created_at

      attribute :employer do |object|
        {
          id: object.employer.id,
          name: object.employer.name,
          location: object.employer.location
        }
      end

      attribute :tags, if: proc { |record|
                             record.tag.present?
                           } do |object|
        object.tag.content
      end

      attribute :applications, if: proc { |record, params|
                                     params[:current_bearer].instance_of?(Employer) && params[:current_bearer].id == record.employer.id
                                   } do |object|
        object.applications.joins(:worker).select(:id, 'workers.name', :status)
      end
    end
  end
end
