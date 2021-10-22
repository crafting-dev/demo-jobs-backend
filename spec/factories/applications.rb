# frozen_string_literal: true

FactoryBot.define do
  factory :application do
    content { 'MyText' }
    status { 'MyString' }
    posting { nil }
    worker { nil }
  end
end
