# frozen_string_literal: true

FactoryBot.define do
  factory :api_key do
    token_digest { 'MyString' }
    bearer { nil }
  end
end
