# frozen_string_literal: true

class Posting < ApplicationRecord
  belongs_to :employer
  has_many :apps
  has_many :tags, as: :taggable

  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true
  validates :hours, presence: true
end
