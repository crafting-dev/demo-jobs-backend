# frozen_string_literal: true

module Api
  class StatusController < ApplicationController
    def show
      render json: {status: "Healthy"}, status: :ok
    end
  end
end    