# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Worker, type: :model do
  before(:all) do
    @worker = create(:worker)
  end

  it 'has valid attributes' do
    expect(@worker).to be_valid
  end

  it 'is not valid without a name' do
    worker2 = build(:worker, name: nil)
    expect(worker2).to_not be_valid
  end

  it 'is not valid without an email' do
    worker2 = build(:worker, email: nil)
    expect(worker2).to_not be_valid
  end

  it 'has a unique email' do
    worker2 = build(:worker, email: @worker.email)
    expect(worker2).to_not be_valid
  end

  it 'is not valid without a password' do
    worker2 = build(:worker, password: nil)
    expect(worker2).to_not be_valid
  end

  it 'is not valid unless password length > 6' do
    worker2 = build(:worker, password: '12345')
    expect(worker2).to_not be_valid
  end

  it 'is not valid without a hourly rate' do
    worker2 = build(:worker, hourly_rate: nil)
    expect(worker2).to_not be_valid
  end
end
