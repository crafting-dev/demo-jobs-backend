# frozen_string_literal: true

module Api
  module V1
    class WorkersController < ApplicationController
      before_action :authenticate_by_key!, except: :create
      before_action :set_worker, only: %i[show update destroy]
      before_action :is_authorized, only: %i[update destroy]

      # GET /workers/:id
      def show
        render_json @worker
      end

      # POST /workers
      def create
        @worker = Worker.create!(worker_params)
        render_json @worker, :created
      end

      # PUT /workers/:id
      def update
        @worker.update(worker_params)
        head :no_content
      end

      # DELETE /workers/:id
      def destroy
        @worker.destroy
        head :no_content
      end

      private

        # Define allowed parameters
        def worker_params
          params.permit(:name, :email, :password, :password_confirmation, :hourly_rate)
        end

        # Set the worker whose id == params[:id]
        # If no record is found, raises an ActiveRecord::RecordNotFound error
        def set_worker
          @worker = Worker.find(params[:id])
        end

        # Set serializer for renderable
        def serializer
          WorkerSerializer
        end

        # Check profile authorization
        def is_authorized
          render status: :unauthorized unless current_bearer.instance_of?(Worker) && current_bearer.id == @worker.id
        end
    end
  end
end
