# frozen_string_literal: true

FactoryBot.define do
  factory :posting do
    title { Faker::Job.title }
    description { Faker::Lorem.paragraph }
    employer_id { 1 }
    hours { 1 }
    status { 'posted' }
  end
end
