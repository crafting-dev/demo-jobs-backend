# frozen_string_literal: true

module Response
  def respond_json(obj, status = :ok)
    render json: obj, status: status
  end
end
