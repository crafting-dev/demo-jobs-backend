# frozen_string_literal: true

module AvatarHelper
  extend ActiveSupport::Concern

  class_methods do
    def avatar_url(email)
      gravatar_id = Digest::MD5.hexdigest(email)
      "https://secure.gravatar.com/avatar/#{gravatar_id}"
    end
  end
end
