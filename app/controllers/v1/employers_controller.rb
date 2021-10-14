class V1::EmployersController < ApplicationController
  def show
    @employer = Employer.find(params[:id])
  end

  def new
    @employer = Employer.new
  end

  def create
    @employer = Employer.new(employer_params)
    if @employer.save
      # account creation success
    else
      # account creation failure
      # render 'new'
    end
  end

  def edit
    @employer = Employer.find(params[:id])
  end

  def update
    @employer = Employer.find(params[:id])
    if @employer.update_attributes(employer_params)
      # success
    else
      # failure
      # render 'edit'
    end
  end

  def destroy
    Employer.find(params[:id]).destroy
  end

  private

    def employer_params
      params.require(:employer).permit(:name, :email, 
        :password, :password_confirmation, :location)
    end
end
