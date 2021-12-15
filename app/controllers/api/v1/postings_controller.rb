# frozen_string_literal: true

module Api
  module V1
    class PostingsController < ApplicationController
      before_action :authenticate_by_key!
      before_action :set_posting, only: %i[show update destroy]
      before_action :can_create, only: :create
      before_action :is_authorized, only: %i[update destroy]

      # GET /postings
      def index
        Rails.logger.info("-------------------------New Log---------------------------------------")
        @postings = Posting.includes(:employer, :tag).order(created_at: :desc)
        render_json @postings, :ok,
                    { fields: { posting: %i[id title hours status tags description employer createdAt] } }
      end

      # GET /postings/:id
      def show
        render_json @posting, :ok, { params: { current_bearer: current_bearer } }
      end

      # POST /postings
      def create
        @posting = Posting.create!(posting_params)
        ExpireJob.set(wait: 14.days).perform_later('posting', @posting.id)
        render_json @posting, :created, { params: { current_bearer: current_bearer } }
      end

      # PUT /postings/:id
      def update
        @posting.update(posting_params)
        head :no_content
      end

      # DELETE /postings/:id
      def destroy
        @posting.destroy
        head :no_content
      end

      private

        # Define allowed parameters
        def posting_params
          params.require(:posting).permit(:title, :description, :employer_id, :hours, :status,
                                          tag_attributes: [:content])
        end

        # Set the posting whose id == params[:id]
        # If no record is found, raises an ActiveRecord::RecordNotFound error
        def set_posting
          @posting = Posting.find(params[:id])
        end

        # Set serializer for renderable
        def serializer
          PostingSerializer
        end

        # Check profile authorization
        def is_authorized
          unless current_bearer.instance_of?(Employer) && current_bearer.id == @posting.employer_id
            render status: :unauthorized
          end
        end

        # Check whether current_bearer has create privileges
        def can_create
          render status: :unauthorized unless current_bearer.instance_of?(Employer)
        end
    end
  end
end
