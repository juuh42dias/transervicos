# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Subarea do
  describe 'associations' do
    it { should belong_to(:area) }
  end
end
