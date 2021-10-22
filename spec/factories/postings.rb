# frozen_string_literal: true

FactoryBot.define do
  factory :posting do
    title { 'MyString' }
    description { 'MyText' }
    employer { nil }
    hours { 1 }
    status { 'MyString' }
  end
end
