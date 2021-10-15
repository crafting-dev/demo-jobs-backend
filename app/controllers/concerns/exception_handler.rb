# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |err|
      respond_json({ message: err.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |err|
      respond_json({ message: err.message }, :unprocessable_entity)
    end
  end
end
