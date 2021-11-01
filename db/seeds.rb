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
  location: 'Gotham City'
)
(2..25).each do |id|
  name = Faker::Name.name
  email = Faker::Internet.unique.email(name: name)
  password = Faker::Internet.password(min_length: 8)
  password_confirmation = password
  location = "#{Faker::Address.city}, #{Faker::Address.country}"

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
  tag = Faker::Job.title.split.join(', ').to_s
  (1..rand(3...8)).each do |_i|
    tag = "#{tag}, #{Faker::Job.title.split.join(', ')}"
  end

  Tag.create!(
    taggable: Employer.find(id),
    content: tag
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
  hourly_rate: 100
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
  tag = Faker::Job.key_skill.split.join(', ').to_s
  (1..rand(3...8)).each do |_i|
    tag = "#{tag}, #{Faker::Job.key_skill.split.join(', ')}"
  end

  Tag.create!(
    taggable: Worker.find(id),
    content: tag
  )
end

greetings = %w[Hello Hi Greetings Hey]

Rails.logger.debug '== Populating Postings =='
(1..200).each do |id|
  title = "#{Faker::Job.employment_type} #{Faker::Job.title} in #{Faker::Job.field}"
  description = [
    "#{greetings.sample} there!",
    'Hope this post finds you well.',
    "We are looking for someone to fill the role of #{Faker::Job.title} on a #{Faker::Job.employment_type} basis.",
    "Preference will be given to someone with a #{Faker::Job.education_level} education level, and at least #{rand(1...10)} years experience in the field.",
    "We are especially looking for the key skill #{Faker::Job.key_skill}.",
    "If you feel this post is relevant or interesting, don't hesitate to get in touch with us!",
    "Field - #{Faker::Job.field}, Seniority - #{Faker::Job.seniority}."
  ].join(' ')
  employer_id = rand(1..25)
  hours = rand(10..100)
  status = 'posted'
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
  tag = Faker::Job.key_skill.split.join(', ').to_s
  (1..rand(3...8)).each do |_i|
    tag = "#{tag}, #{Faker::Job.key_skill.split.join(', ')}"
  end

  Tag.create!(
    taggable: Posting.find(id),
    content: tag
  )
end

Rails.logger.debug '== Populating Applications =='
(1..500).each do |id|
  posting_id = rand(1..200)
  worker_id = rand(1..50)
  content = [
    "#{greetings.sample}! I would like to apply to this position.",
    "I have about #{rand(1...20)} years experience in this role.",
    "I have also completed my #{Faker::Job.education_level} with honours.",
    "I have key skills in #{Faker::Job.key_skill}.",
    'I look forward to hearing from you. Thanks!'
  ].join(' ')
  status = %w[applied rejected hired].sample
  created_at = Faker::Date.backward(days: 10)

  status = 'expired' if (Date.current - created_at) > 7 && status == 'applied'

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
  tag = Faker::Job.key_skill.split.join(', ').to_s
  (1..rand(3...8)).each do |_i|
    tag = "#{tag}, #{Faker::Job.key_skill.split.join(', ')}"
  end

  Tag.create!(
    taggable: Application.find(id),
    content: tag
  )
end

Rails.logger.debug '== Preserving temporal logic =='
Posting.where(status: 'expired').joins(:applications).where(applications: { status: 'applied' }).each do |post|
  post.update!(status: 'posted')
end
