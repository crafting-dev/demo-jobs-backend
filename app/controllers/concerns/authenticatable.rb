# frozen_string_literal: true

module Authenticatable
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods

  attr_reader :current_api_key, :current_bearer

  def authenticate_by_key!
    @current_bearer = authenticate_or_request_with_http_token(&method(:authenticator))
  end

  private

    attr_writer :current_api_key, :current_bearer

    def authenticator(token, _options)
      @current_api_key = ApiKey.authenticate_by_token!(token)
      current_api_key&.bearer
    end
end
