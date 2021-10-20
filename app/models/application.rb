# frozen_string_literal: true

class Application < ApplicationRecord
  has_many :tags, as: :taggable, dependent: :destroy
  belongs_to :posting
  belongs_to :worker

  validates :content, presence: true
end
