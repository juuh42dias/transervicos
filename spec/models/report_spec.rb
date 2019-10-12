# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Report do
  describe 'associations' do
    it { should belong_to(:service) }
  end

  describe 'validations' do
    it { should validate_presence_of(:detail) }
    it { should validate_presence_of(:service) }
    it { should validate_presence_of(:email) }
  end
end
