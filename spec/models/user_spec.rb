require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Model validations' do
    it 'ensures password optional' do
      user = described_class.new(email: 'test@mail.test', first_name: 'Name', last_name: 'Last').save
      expect(user).to eq(false)
    end

    it 'wiht validation optional' do
      user = described_class.new(email: 'test@mail.test', first_name: 'Name', last_name: 'Last',
                                 password: '123214', mobile: '+380967478717').save
      expect(user).to eq(true)
    end

    it 'ensures email validator works' do
      user = described_class.new(email: '@mail.test', first_name: 'Name', last_name: 'Last',
                                 password: '123214', mobile: '+380967478717').save
      expect(user).to eq(false)
    end

    it 'ensures first and second name validator works' do
      user = described_class.new(email: 'mail@mail.test',
                                 password: '123214', mobile: '+380967478717').save
      expect(user).to eq(false)
    end
  end
end
