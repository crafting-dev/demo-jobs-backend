# frozen_string_literal: true

module Renderable
  def render_json(obj, status = :ok)
    render json: serializer.new(obj).serializable_hash.to_json, status: status
  end
end
