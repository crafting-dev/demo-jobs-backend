# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tag, type: :model do
  before(:all) do
    @employer = create(:employer)
    @tag = create(:tag, taggable: @employer)
  end

  it 'is valid with valid attributes' do
    expect(@tag).to be_valid
  end

  it 'is not valid without a taggable' do
    @tag.taggable = nil
    expect(@tag).to_not be_valid
  end
end
