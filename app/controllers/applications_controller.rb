class ApplicationsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def application_params
      params.require(:application).permit(:posting_id, :worker_id,
        :content, :decision_made, :hired, :expired)
    end
end
