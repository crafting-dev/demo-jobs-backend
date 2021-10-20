# frozen_string_literal: true

module Renderable
  def render_json(object, status = :ok, options = {})
    render json: serializer.new(object, options).serializable_hash.to_json, status: status
  end
end
