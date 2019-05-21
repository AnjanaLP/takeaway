require 'order'

describe Order do
  subject(:order) { described_class.new }

  describe '#basket' do
    it 'is initially empty' do
      expect(order.basket).to be_empty
    end
  end

  describe '#add' do
    it 'adds the dish with quantity to the basket' do
      order.add(:salad, 3)
      expect(order.basket).to eq(salad: 3)
    end
  end
end
