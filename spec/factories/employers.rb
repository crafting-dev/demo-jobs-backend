# frozen_string_literal: true

FactoryBot.define do
  factory :employer do
    name { 'Bruce Wayne' }
    email { 'batman@crafting.dev' }
    password_digest { 'iambatman' }
    location { 'Gotham' }
  end
end
