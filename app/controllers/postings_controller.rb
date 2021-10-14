class PostingsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end

  private

    def posting_params
      params.require(:posting).permit(:title, :description, 
        :employer_id, :hours, :expired)
    end
end
