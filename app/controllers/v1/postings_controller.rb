# frozen_string_literal: true

module V1
  class PostingsController < ApplicationController
    before_action :logged_in_user, only: %i[index show create update destroy]
    before_action :set_posting, only: %i[show update destroy]

    # GET /postings
    def index
      @postings = Posting.all
      respond_json(@postings)
    end

    # GET /postings/:id
    def show
      respond_json(@posting)
    end

    # POST /postings
    def create
      @posting = Posting.create!(posting_params)
      respond_json(@posting, :created)
    end

    # PUT /postings/:id
    def update
      @posting.update(posting_params)
      head :no_content
    end

    # DELETE /postings/:id
    def destroy
      @posting.destroy
      head :no_content
    end

    private

    def posting_params
      params.require(:posting).permit(:title, :description, :employer_id, :hours, :status)
    end

    def set_posting
      @posting = Posting.find(params[:id])
    end

    def logged_in_user
      unless logged_in?('employer') || logged_in?('worker')
        respond_json({ message: 'Please log in to proceed' }, :unprocessable_entity)
      end
    end
  end
end
