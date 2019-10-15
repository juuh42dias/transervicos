# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Area do
  describe 'associations' do
    it { should have_many(:subareas) }
  end
end
