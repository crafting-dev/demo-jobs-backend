# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employer, type: :model do
  before(:all) do
    @employer = create(:employer)
  end

  it 'has valid attributes' do
    expect(@employer).to be_valid
  end

  it 'is not valid without a name' do
    employer2 = build(:employer, name: nil)
    expect(employer2).to_not be_valid
  end

  it 'is not valid without an email' do
    employer2 = build(:employer, email: nil)
    expect(employer2).to_not be_valid
  end

  it 'has a unique email' do
    employer2 = build(:employer, email: @employer.email)
    expect(employer2).to_not be_valid
  end

  it 'is not valid without a password' do
    employer2 = build(:employer, password: nil)
    expect(employer2).to_not be_valid
  end

  it 'is not valid unless password length > 6' do
    employer2 = build(:employer, password: '12345')
    expect(employer2).to_not be_valid
  end

  it 'is not valid without a location' do
    employer2 = build(:employer, location: nil)
    expect(employer2).to_not be_valid
  end
end
