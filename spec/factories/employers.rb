# frozen_string_literal: true

FactoryBot.define do
  factory :employer do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password_digest { Faker::Internet.password(min_length: 6) }
    location { Faker::Address.full_address }
  end
end
