class EmployersController < ApplicationController
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

    def employer_params
      params.require(:employer).permit(:name, :email, 
        :password, :password_confirmation, :location)
    end
end
