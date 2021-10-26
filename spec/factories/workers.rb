# frozen_string_literal: true

FactoryBot.define do
  factory :worker do
    name { 'Clark Kent' }
    email { 'superman@crafting.dev' }
    password_digest { 'superman' }
    hourly_rate { '9.99' }
  end
end
