require 'rails_helper'

RSpec.describe Enterprise, type: :model do
  describe 'Model validations' do
    let(:user) { create(:user) }

    it 'with validation optional' do
      enterprise = described_class.new(title: 'Title', headquaters: 'Ukraine', user: user).save
      expect(enterprise).to eq(true)
    end

    it 'ensures title validator works' do
      enterprise = described_class.new(headquaters: 'Ukraine', user: user).save
      expect(enterprise).to eq(false)
    end

    it 'ensures content validator works' do
      enterprise = described_class.new(title: 'Title', user: user).save
      expect(enterprise).to eq(false)
    end
  end
end
