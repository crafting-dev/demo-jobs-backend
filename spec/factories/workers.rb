# frozen_string_literal: true

FactoryBot.define do
  factory :worker do
    name { 'MyString' }
    email { 'MyString' }
    password_digest { 'MyString' }
    hourly_rate { '9.99' }
  end
end
