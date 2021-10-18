# frozen_string_literal: true

FactoryBot.define do
  factory :tag do
    content { Faker::Lorem.sentence }
    taggable { nil }
  end
end
