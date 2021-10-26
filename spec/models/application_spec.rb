# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Application, type: :model do
  before(:all) do
    @employer = create(:employer)
    @worker = create(:worker)
    @posting = create(:posting, employer: @employer)
    @application = create(:application, posting: @posting, worker: @worker)
  end

  it 'is valid with valid attributes' do
    expect(@application).to be_valid
  end

  it 'is not valid without content' do
    @application.content = nil
    expect(@application).to_not be_valid
  end

  it 'is not valid without posting' do
    @application.posting = nil
    expect(@application).to_not be_valid
  end

  it 'is not valid without worker' do
    @application.worker = nil
    expect(@application).to_not be_valid
  end
end
