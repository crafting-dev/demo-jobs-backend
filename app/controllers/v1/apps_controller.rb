# frozen_string_literal: true

module V1
  class AppsController < ApplicationController
    before_action :logged_in_user, only: %i[index show create update destroy]
    before_action :set_app, only: %i[show update destroy]

    # GET /apps
    def index
      @apps = App.all
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
      @app = App.find(params[:id])
    end

    def logged_in_user
      unless logged_in?('employer') || logged_in?('worker')
        respond_json({ message: 'Please log in to proceed' }, :unprocessable_entity)
      end
    end
  end
end
