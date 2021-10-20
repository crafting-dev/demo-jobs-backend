# frozen_string_literal: true

class Employer < ApplicationRecord
  has_many :postings, dependent: :destroy
  has_many :applications, through: :postings, dependent: :destroy
  has_many :tags, as: :taggable, dependent: :destroy
  has_many :api_keys, as: :bearer, dependent: :destroy

  before_save :downcase_email
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true

  private

    def downcase_email
      self.email = email.downcase
    end
end
