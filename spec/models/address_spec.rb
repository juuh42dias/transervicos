# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'associations' do
    it { should belong_to(:service) }
    it { should belong_to(:state) }
    it { should belong_to(:city) }
  end

  describe 'attributes' do
    it { should accept_nested_attributes_for(:city) }
    it { should accept_nested_attributes_for(:state) }
  end
end
