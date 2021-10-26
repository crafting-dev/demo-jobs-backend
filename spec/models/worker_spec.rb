# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Worker, type: :model do
  before(:all) do
    @worker = create(:worker)
  end

  it 'is valid with valid attributes' do
    expect(@worker).to be_valid
  end

  it 'is not valid without a name' do
    @worker.name = nil
    expect(@worker).to_not be_valid
  end

  it 'is not valid without an email' do
    @worker.email = nil
    expect(@worker).to_not be_valid
  end

  it 'is not valid with invalid email' do
    @worker.email = 'someinvalidemail'
    expect(@worker).to_not be_valid
  end

  it 'is not valid without password' do
    @worker.password = nil
    expect(@worker).to_not be_valid
  end

  it 'is not valid if password and confirmation do not match' do
    @worker.password = '12345678'
    @worker.password_confirmation = 'abcdefgh'
    expect(@worker).to_not be_valid
  end

  it 'is not valid if password length < 8' do
    @worker.password = '1234567'
    expect(@worker).to_not be_valid
  end
end
