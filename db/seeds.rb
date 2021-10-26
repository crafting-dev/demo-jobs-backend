# frozen_string_literal: true

require 'faker'
require 'date'

Rails.logger.debug '== Cleaning database =='
Application.delete_all
Posting.delete_all
Employer.delete_all
Worker.delete_all
Tag.delete_all
ApiKey.delete_all

Rails.logger.debug '== Populating Employers =='
# Testing credentials for Employer user
Employer.create!(
  id: 1,
  name: 'Bruce Wayne',
  email: 'batman@crafting.dev',
  password: 'iambatman',
  password_confirmation: 'iambatman',
  location: 'Gotham'
)
(2..25).each do |id|
  name = Faker::Name.name
  email = Faker::Internet.unique.email(name: name)
  password = Faker::Internet.password(min_length: 8)
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

Rails.logger.debug '== Populating Employers Tags =='
(1..25).each do |id|
  c1 = Faker::Job.title.split
  c2 = Faker::Job.title.split
  c3 = Faker::Job.field.split
  c4 = c1 + c2 + c3
  content = c4.uniq.join(', ')

  Tag.create!(
    taggable: Employer.find(id),
    content: content
  )
end

Rails.logger.debug '== Populating Workers =='
# Testing credentials for Worker user
Worker.create!(
  id: 1,
  name: 'Clark Kent',
  email: 'superman@crafting.dev',
  password: 'superman',
  password_confirmation: 'superman',
  hourly_rate: 0.0
)
(2..50).each do |id|
  name = Faker::Name.name
  email = Faker::Internet.unique.email(name: name)
  password = Faker::Internet.password(min_length: 8)
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

Rails.logger.debug '== Populating Workers Tags =='
(1..50).each do |id|
  c1 = Faker::Job.title.split
  c2 = Faker::Job.title.split
  c3 = Faker::Job.field.split
  c4 = c1 + c2 + c3
  content = c4.uniq.join(', ')

  Tag.create!(
    taggable: Worker.find(id),
    content: content
  )
end

Rails.logger.debug '== Populating Postings =='
(1..200).each do |id|
  title = Faker::Job.title
  description = [Faker::Job.employment_type, Faker::Job.field, Faker::Job.seniority, Faker::Job.position,
                 'needed with a particular skill in', Faker::Job.key_skill].reject(&:empty?).join(' ')
  employer_id = rand(1..25)
  hours = rand(10..100)
  status = %w[posted expired].sample
  created_at = Faker::Date.backward(days: 20)

  status = 'expired' if (Date.current - created_at) > 14

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

Rails.logger.debug '== Populating Postings Tags =='
(1..200).each do |id|
  c1 = Faker::Job.title.split
  c2 = Faker::Job.title.split
  c3 = Faker::Job.field.split
  c4 = c1 + c2 + c3
  content = c4.uniq.join(', ')

  Tag.create!(
    taggable: Posting.find(id),
    content: content
  )
end

Rails.logger.debug '== Populating Applications =='
(1..500).each do |id|
  greeting = %w[Hi! Hello! Greetings! Hey!].sample
  posting_id = rand(1..200)
  worker_id = rand(1..50)
  content = [greeting, 'I would like to apply to this position. I have attained my', Faker::Job.education_level,
             'and have excellent', Faker::Job.key_skill, 'skills. Looking forward to hearing from you. Thanks!'].reject(&:empty?).join(' ')
  status = %w[applied expired rejected hired].sample
  created_at = Faker::Date.backward(days: 10)

  status = 'expired' if (Date.current - created_at) > 7

  Application.create!(
    id: id,
    posting_id: posting_id,
    worker_id: worker_id,
    content: content,
    status: status,
    created_at: created_at
  )
end

Rails.logger.debug '== Populating Applications Tags =='
(1..500).each do |id|
  c1 = Faker::Job.title.split
  c2 = Faker::Job.title.split
  c3 = Faker::Job.field.split
  c4 = c1 + c2 + c3
  content = c4.uniq.join(', ')

  Tag.create!(
    taggable: Application.find(id),
    content: content
  )
end

Rails.logger.debug '== Preserving temporal logic =='
Posting.where(status: 'expired').joins(:applications).where(applications: { status: 'applied' }).each do |post|
  post.update!(status: 'posted')
end
