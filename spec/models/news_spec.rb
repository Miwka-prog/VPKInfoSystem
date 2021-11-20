require 'rails_helper'

RSpec.describe News, type: :model do
  describe 'Model validations' do
    let(:user) { create(:user) }

    it 'with validation optional' do
      news = described_class.new(title: 'Title', content: 'Content', user: user).save
      expect(news).to eq(true)
    end

    it 'ensures title validator works' do
      news = described_class.new(content: 'Content', user: user).save
      expect(news).to eq(false)
    end

    it 'ensures content validator works' do
      news = described_class.new(title: 'Title', user: user).save
      expect(news).to eq(false)
    end
  end
end
