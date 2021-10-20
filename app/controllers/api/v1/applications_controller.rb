# frozen_string_literal: true

module Api
  module V1
    class ApplicationsController < ApplicationController
      before_action :authenticate_by_key!
      before_action :set_application, only: %i[show update destroy]
      before_action :can_create, only: :create
      before_action :is_authorized, only: :destroy

      # GET /applications
      def index
        @applications = current_bearer.applications.includes(:tags, :posting, :worker)
        render_json @applications
      end

      # GET /applications/:id
      def show
        render_json @application
      end

      # POST /applications
      def create
        @application = Application.create!(application_params)
        render_json @application, :created
      end

      # PUT /applications/:id
      def update
        @application.update(application_params)
        head :no_content
      end

      # DELETE /applications/:id
      def destroy
        @application.destroy
        head :no_content
      end

      private

        # Define allowed parameters
        def application_params
          params.permit(:content, :status, :posting_id, :worker_id)
        end

        # Set the application whose id == params[:id]
        # If no record is found, raises an ActiveRecord::RecordNotFound error
        def set_application
          @application = current_bearer.applications.find(params[:id])
        end

        # Set serializer for renderable
        def serializer
          ApplicationSerializer
        end

        # Check profile authorization
        def is_authorized
          unless current_bearer.instance_of?(Worker) && current_bearer.id == @application.worker_id
            render status: :unauthorized
          end
        end

        # Check whether current_bearer has create privileges
        def can_create
          render status: :unauthorized unless current_bearer.instance_of?(Worker)
        end
    end
  end
end
