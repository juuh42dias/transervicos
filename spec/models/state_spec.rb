# frozen_string_literal: true

require 'rails_helper'

RSpec.describe State do
  describe 'associations' do
    it { should have_many(:cities) }
  end
end
