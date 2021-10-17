# frozen_string_literal: true

module V1
  class WorkersController < ApplicationController
    before_action :logged_in_worker, only: %i[index show update destroy]
    before_action :set_worker, only: %i[show update destroy]

    # GET /workers
    def index
      @workers = Worker.all
      respond_json(@workers)
    end

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

    def logged_in_worker
      respond_json({ message: 'Please log in to proceed' }, :unprocessable_entity) unless logged_in? 'worker'
    end
  end
end
