# frozen_string_literal: true

module V1
  class WorkersController < ApplicationController
    before_action :is_logged_in, only: %i[show update destroy]
    before_action :set_worker, only: %i[show update destroy]

    # GET /workers/:id
    def show
      respond_json(@worker)
    end

    # POST /workers
    def create
      @worker = Worker.create!(worker_params)
      respond_json(@worker, :created)
    end

    # PUT /workers/:id
    def update
      @worker.update(worker_params)
      head :no_content
    end

    # DELETE /workers/:id
    def destroy
      if @worker.id != current_user.id
        respond_json({ message: 'Access denied' }, :unauthorized)
      end
      @worker.destroy
      head :no_content
    end

    private

    def worker_params
      params.require(:worker).permit(:name, :email, :password, :password_confirmation, :hourly_rate)
    end

    def set_worker
      @worker = Worker.find(params[:id])
    end

    def is_logged_in
      respond_json({ message: 'Access denied' }, :unauthorized) unless logged_in?
    end
  end
end
