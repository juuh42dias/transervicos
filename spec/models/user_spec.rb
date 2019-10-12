# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'associations' do
    it { should have_many(:services) }
  end

  describe 'validations' do
    it { should validate_presence_of(:social_name) }
    it { should validate_presence_of(:birth_date) }
    it { should validate_uniqueness_of(:username) }
  end
end
