# frozen_string_literal: true

FactoryBot.define do
  factory :app do
    posting_id { 1 }
    worker_id { 1 }
    content { Faker::Lorem.paragraph }
    status { 'applied' }
  end
end
