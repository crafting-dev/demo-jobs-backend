# frozen_string_literal: true

module Api
  module V1
    class ExpireJob < ApplicationJob
      queue_as :default

      retry_on PostingHasActiveApplicationsException, wait: 7.days

      def perform(class_type, id)
        case class_type
        when 'application'
          application = Application.find(id)

          application.update(status: 'expired') if application.status == 'applied'

        when 'posting'
          posting = Posting.find(id)

          raise PostingHasActiveApplicationsException if posting.applications.pluck(:status).include? 'applied'

          posting.update(status: 'expired')
        end
      end
    end
  end
end
