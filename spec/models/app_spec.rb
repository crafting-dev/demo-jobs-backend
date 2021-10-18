# frozen_string_literal: true

require 'rails_helper'

RSpec.describe App, type: :model do
  before(:all) do
    @app = create(:app)
  end

  it 'has valid attributes' do
    expect(@app).to be_valid
  end
end
