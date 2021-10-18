# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Posting, type: :model do
  before(:all) do
    @posting = create(:posting)
  end

  it 'has valid attributes' do
    expect(@posting).to be_valid
  end
end
