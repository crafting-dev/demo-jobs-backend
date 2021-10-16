# frozen_string_literal: true

module V1
  class EmployersController < ApplicationController
    before_action :set_employer, only: %i[show update destroy]

    # GET /employers
    def index
      @employers = Employer.all
      respond_json(@employers)
    end

    # GET /employers/:id
    def show
      respond_json(@employer)
    end

    # POST /employers
    def create
      @employer = Employer.create!(employer_params)
      respond_json(@employer, :created)
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

    def employer_params
      params.require(:employer).permit(:name, :email, :password, :password_confirmation, :location)
    end

    def set_employer
      @employer = Employer.find(params[:id])
    end
  end
end
