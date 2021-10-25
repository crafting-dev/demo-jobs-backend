# frozen_string_literal: true

module Api
  module V1
    class ApplicationSerializer
      include JSONAPI::Serializer

      set_type :application

      attributes :status

      attribute :tags, if: proc { |record, params|
                             !params[:is_collection] && record.tag.present?
                           } do |object|
        object.tag.content
      end

      attribute :content, if: proc { |_object, params|
                                !params[:is_collection]
                              }

      attribute :posting do |object|
        {
          id: object.posting.id,
          title: object.posting.title
        }
      end

      attribute :worker do |object|
        {
          id: object.worker.id,
          name: object.worker.name
        }
      end
    end
  end
end
