# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employer, type: :model do
  before(:all) do
    @employer = create(:employer)
  end

  it 'is valid with valid attributes' do
    expect(@employer).to be_valid
  end

  it 'is not valid without a name' do
    @employer.name = nil
    expect(@employer).to_not be_valid
  end

  it 'is not valid without an email' do
    @employer.email = nil
    expect(@employer).to_not be_valid
  end

  it 'is not valid with invalid email' do
    @employer.email = 'someinvalidemail'
    expect(@employer).to_not be_valid
  end

  it 'is not valid without password' do
    @employer.password = nil
    expect(@employer).to_not be_valid
  end

  it 'is not valid if password and confirmation do not match' do
    @employer.password = '12345678'
    @employer.password_confirmation = 'abcdefgh'
    expect(@employer).to_not be_valid
  end

  it 'is not valid if password length < 8' do
    @employer.password = '1234567'
    expect(@employer).to_not be_valid
  end
end
