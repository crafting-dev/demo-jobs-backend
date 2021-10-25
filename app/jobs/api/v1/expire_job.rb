# frozen_string_literal: true

module Api
  module V1
    class ExpireJob < ApplicationJob
      queue_as :default

      def perform(*args)
        # Do something later
      end
    end
  end
end
