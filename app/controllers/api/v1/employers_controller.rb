# frozen_string_literal: true

module Api
  module V1
    class EmployersController < ApplicationController
      before_action :authenticate_by_key!, except: :create
      before_action :set_employer, only: %i[show update destroy]
      before_action :is_authorized, only: %i[update destroy]

      # GET /employers/:id
      def show
        render_json @employer
      end

      # POST /employers
      def create
        @employer = Employer.create!(employer_params)
        render_json @employer, :created
      end

      # PUT /employers/:id
      def update
        @employer.update(employer_params)
        head :no_content
      end

      # DELETE /employers/:id
      def destroy
        @employer.destroy
        head :no_content
      end

      private

        # Define allowed parameters
        def employer_params
          params.require(:employer).permit(:name, :email, :password, :password_confirmation, :location)
        end

        # Set the employer whose id == params[:id]
        # If no record is found, raises an ActiveRecord::RecordNotFound error
        def set_employer
          @employer = Employer.find(params[:id])
        end

        # Set serializer for renderable
        def serializer
          EmployerSerializer
        end

        # Check profile authorization
        def is_authorized
          render status: :unauthorized unless current_bearer.instance_of?(Employer) && current_bearer.id == @employer.id
        end
    end
  end
end
