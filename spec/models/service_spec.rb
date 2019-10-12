# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Service do
  describe 'associations' do
    it { should have_one(:address) }
    it { should belong_to(:subarea) }
    it { should belong_to(:user) }
    it { should accept_nested_attributes_for(:address) }
  end

  describe 'validations' do
    it { should validate_presence_of(:subarea) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
  end
end
