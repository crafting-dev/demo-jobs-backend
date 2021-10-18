# frozen_string_literal: true

module V1
  class AppsController < ApplicationController
    before_action :is_logged_in, only: %i[index show create update destroy]
    before_action :is_worker, only: %i[create destroy]
    before_action :set_app, only: %i[show update destroy]

    # GET /apps
    def index
      @apps = current_user.apps
      respond_json(@apps)
    end

    # GET /apps/:id
    def show
      respond_json(@app)
    end

    # POST /apps
    def create
      @app = App.create!(app_params)
      respond_json(@app, :created)
    end

    # PUT /apps/:id
    def update
      @app.update(app_params)
      head :no_content
    end

    # DELETE /apps/:id
    def destroy
      @app.destroy
      head :no_content
    end

    private

    def app_params
      params.require(:app).permit(:posting_id, :worker_id, :content, :status)
    end

    def set_app
      @app = current_user.apps.find(params[:id])
    end

    def is_logged_in
      respond_json({ message: 'Access denied' }, :unauthorized) unless logged_in?
    end

    def is_worker
      respond_json({ message: 'Access denied' }, :unauthorized) unless current_user.instance_of?(Worker)
    end
  end
end
