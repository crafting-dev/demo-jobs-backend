# frozen_string_literal: true

FactoryBot.define do
  factory :posting do
    title { 'MyString' }
    description { 'MyText' }
    employer_id { 1 }
    hours { 1 }
    status { 'MyString' }
  end
end
