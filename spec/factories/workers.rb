# frozen_string_literal: true

FactoryBot.define do
  factory :worker do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password_digest { Faker::Internet.password(min_length: 6) }
    hourly_rate { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
  end
end
