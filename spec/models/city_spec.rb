# frozen_string_literal: true

require 'rails_helper'

RSpec.describe City do
  describe 'associations' do
    it { should belong_to(:state) }
  end
end
