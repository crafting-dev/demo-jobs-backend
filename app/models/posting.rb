# frozen_string_literal: true

class Posting < ApplicationRecord
  has_one :tag, as: :taggable, dependent: :destroy

  has_many :applications, dependent: :destroy
  
  belongs_to :employer

  accepts_nested_attributes_for :tag, reject_if: proc { |attributes| attributes['content'].blank? }

  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true
end
