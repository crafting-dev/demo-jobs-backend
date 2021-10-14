class V1::PostingsController < ApplicationController
  before_action :set_posting, only: [:show, :destroy]

  # GET /postings
  def index
    @postings = Posting.all
    respond_json(@postings)
  end

  # POST /postings
  def create
    @posting = Posting.create!(posting_params)
    respond_json(@posting, :created)
  end

  # GET /postings/:id
  def show
    respond_json(@posting)
  end

  # DELETE /postings/:id
  def destroy
    @posting.destroy
    head :no_content
  end

  private

    def posting_params
      params.require(:posting).permit(:title, :description, 
        :employer_id, :hours, :expired)
    end

    def set_posting
      @posting = Posting.find(params[:id])
    end
end
