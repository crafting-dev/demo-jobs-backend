class Employer < ApplicationRecord
    has_many :postings
    has_many :applications, through: :postings
    has_many :tags, as: :taggable

    before_save :downcase_email

    validates :name, presence: true, length: { maximum: 255 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
    validates :location, presence: true

    private

        def downcase_email
            self.email = email.downcase
        end
end
