# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'date'

(1..100).each do |id|
  name = Faker::Name.name
  email = Faker::Internet.unique.email(name: name)
  password = Faker::Internet.password(min_length: 6)
  password_confirmation = password
  location = Faker::Address.full_address

  Employer.create!(
    id: id,
    name: name,
    email: email,
    password: password,
    password_confirmation: password_confirmation,
    location: location
  )
end

(1..200).each do |id|
  name = Faker::Name.name
  email = Faker::Internet.unique.email(name: name)
  password = Faker::Internet.password(min_length: 6)
  password_confirmation = password
  hourly_rate = Faker::Number.decimal(l_digits: 2, r_digits: 2)

  Worker.create!(
    id: id,
    name: name,
    email: email,
    password: password,
    password_confirmation: password_confirmation,
    hourly_rate: hourly_rate
  )
end

(1..1000).each do |id|
  title = Faker::Job.title
  description = [Faker::Job.employment_type, Faker::Job.field, Faker::Job.seniority, Faker::Job.position,
                 'needed with a particular skill in', Faker::Job.key_skill].reject(&:empty?).join(' ')
  employer_id = rand(1..100)
  hours = rand(10..100)
  status = %w[posted expired].sample
  created_at = Faker::Date.backward(days: 20)

  status = expired if (Date.current - Date.parse(created_at)) > 14

  Posting.create!(
    id: id,
    title: title,
    description: description,
    employer_id: employer_id,
    hours: hours,
    status: status,
    created_at: created_at
  )
end

(1..2000).each do |id|
  greeting = %w[Hi! Hello! Greetings! Hey!].sample
  posting_id = rand(1..1000)
  worker_id = rand(1..200)
  content = [greeting, 'I would like to apply to this position. I have attained my', Faker::Job.education_level,
             'and have excellent', Faker::Job.key_skill, 'skills. Looking forward to hearing from you. Thanks!'].reject(&:empty?).join(' ')
  status = %w[applied expired rejected hired].sample # Make valid
  created_at = Faker::Date.backward(days: 10)

  status = expired if (Date.current - Date.parse(created_at)) > 7

  App.create!(
    id: id,
    posting_id: posting_id,
    worker_id: worker_id,
    content: content,
    status: status,
    created_at: created_at
  )
end
