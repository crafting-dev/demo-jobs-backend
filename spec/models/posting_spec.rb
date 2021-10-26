# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Posting, type: :model do
  before(:all) do
    @employer = create(:employer)
    @posting = create(:posting, employer: @employer)
  end

  it 'is valid with valid attributes' do
    expect(@posting).to be_valid
  end

  it 'is not valid without a title' do
    @posting.title = nil
    expect(@posting).to_not be_valid
  end

  it 'is not valid without a description' do
    @posting.description = nil
    expect(@posting).to_not be_valid
  end

  it 'is not valid without an employer' do
    @posting.employer = nil
    expect(@posting).to_not be_valid
  end
end
