# frozen_string_literal: true

module V1
  class PostingsController < ApplicationController
    before_action :is_logged_in, only: %i[index show create update destroy]
    before_action :is_employer, only: %i[create destroy]
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
      if !current_user.postings.exists?(id: @posting.id)
        respond_json({ message: 'Access denied' }, :unauthorized)
      end
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

    def is_logged_in
      respond_json({ message: 'Access denied' }, :unauthorized) unless logged_in?
    end

    def is_employer
      respond_json({ message: 'Access denied' }, :unauthorized) unless current_user.instance_of?(Employer)
    end
  end
end
