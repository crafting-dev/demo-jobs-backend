# frozen_string_literal: true

FactoryBot.define do
  factory :employer do
    name { 'MyString' }
    email { 'MyString' }
    password_digest { 'MyString' }
    location { 'MyString' }
  end
end
