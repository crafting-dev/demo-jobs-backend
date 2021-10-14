class V1::ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :destroy]

  # GET /applications
  def index
    @applications = Application.all
    respond_json(@applications)
  end

  # POST /applications
  def create
    @application = Application.create!(application_params)
    respond_json(@application, :created)
  end

  # GET /applications/:id
  def show
    respond_json(@application)
  end

  # DELETE /applications/:id
  def destroy
    @application.destroy
    head :no_content
  end

  private

    def application_params
      params.require(:application).permit(:posting_id, :worker_id,
        :content, :decision_made, :hired, :expired)
    end

    def set_application
      @application = Application.find(params[:id])
    end
end
