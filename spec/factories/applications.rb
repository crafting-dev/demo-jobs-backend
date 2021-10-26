# frozen_string_literal: true

FactoryBot.define do
  factory :application do
    content { 'MyText' }
    status { 'applied' }
    posting { nil }
    worker { nil }
  end
end
