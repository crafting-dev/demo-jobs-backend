# frozen_string_literal: true

FactoryBot.define do
  factory :tag do
    content { 'MyString' }
    taggable { nil }
  end
end
