# frozen_string_literal: true

class ApiKey < ApplicationRecord
  attr_accessor :token

  belongs_to :bearer, polymorphic: true

  before_create :generate_token

  ## WARNING
  ## Secret key hardcoded for demo app use only!
  ## Keep your secret keys a secret!
  ## Set and use environment variables instead.
  SECRET_KEY = '0db8c7510326a0517d9ffa2f50594c430b274bb1282931cfcb22af8b6ba0a92e798b1460a2da00698077a95fb71008cc82bc5a2c285b598a99fdb4a149ca4e6e'

  def self.authenticate_by_token!(token)
    digest = OpenSSL::HMAC.hexdigest('SHA256', SECRET_KEY, token)
    find_by(token_digest: digest)
  end

  private

    def generate_token
      raise ActiveRecord::RecordInvalid, 'Token is required' if token.blank?

      digest = OpenSSL::HMAC.hexdigest('SHA256', SECRET_KEY, token)

      self.token_digest = digest
    end
end
