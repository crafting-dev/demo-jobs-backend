class WorkersController < ApplicationController
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

    def worker_params
      params.require(:worker).permit(:name, :email, 
        :password, :password_confirmation, :hourly_rate)
    end
end
