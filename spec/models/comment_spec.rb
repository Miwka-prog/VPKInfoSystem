require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Model validations' do
    let(:user) { create(:user) }
    let(:news) { create(:news) }

    it 'with validation optional' do
      comment = described_class.new(content: 'Content', user: user, news: news).save
      expect(comment).to eq(true)
    end

    it 'ensures content validator works' do
      comment = described_class.new(user: user, news: news).save
      expect(comment).to eq(false)
    end
  end
end
