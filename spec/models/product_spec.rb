require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Model validations' do
    let(:user) { create(:user) }
    let(:enterprise) { create(:enterprise, user: user) }

    it 'with validation optional' do
      product = described_class.new(name: 'Name', enterprise: enterprise).save
      expect(product).to eq(true)
    end

    it 'ensures content validator works' do
      product = described_class.new(enterprise: enterprise).save
      expect(product).to eq(false)
    end
  end
end
