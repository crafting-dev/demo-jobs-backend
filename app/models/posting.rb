# frozen_string_literal: true

class Posting < ApplicationRecord
  has_many :applications, dependent: :destroy
  has_many :tags, as: :taggable, dependent: :destroy
  belongs_to :employer

  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true
end
