class V1::WorkersController < ApplicationController
  before_action :set_worker, only: [:show, :update, :destroy]

  # POST /workers
  def create
    @worker = Worker.create!(worker_params)
    respond_json(@worker, :created)
  end

  # GET /workers/:id
  def show
    respond_json(@worker)
  end

  # PUT /workders/:id
  def update
    @worker.update(worker_params)
    head :no_content
  end

  # DELETE /workders/:id
  def destroy
    @worker.destroy
    head :no_content
  end

  private

    def worker_params
      params.require(:worker).permit(:name, :email, 
        :password, :password_confirmation, :hourly_rate)
    end

    def set_worker
      @worker = Worker.find(params[:id])
    end
end
