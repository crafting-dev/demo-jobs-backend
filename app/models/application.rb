class Application < ApplicationRecord
    belongs_to :posting
    belongs_to :worker
    has_many :tags, as: :taggable

    validates :content, presence: true
end
