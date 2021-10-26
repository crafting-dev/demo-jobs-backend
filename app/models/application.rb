# frozen_string_literal: true

class Application < ApplicationRecord
  has_one :tag, as: :taggable, dependent: :destroy

  belongs_to :posting
  belongs_to :worker

  accepts_nested_attributes_for :tag, reject_if: proc { |attributes| attributes['content'].blank? }

  validates :content, presence: true
end
