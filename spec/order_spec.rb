require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu)      { double :menu }

  describe '#basket' do
    it 'is initially empty' do
      expect(order.basket).to be_empty
    end
  end

  describe '#empty_basket?' do
    it 'knows if the basket is empty' do
      expect(order.empty_basket?).to be true
    end

    it 'knows if the basket is not empty' do
      order.add(:salad, 3)
      expect(order.empty_basket?).to be false
    end
  end

  describe '#add' do
    it 'adds the dish with quantity to the basket' do
      order.add(:salad, 3)
      expect(order.basket).to eq(salad: 3)
    end
  end

  describe '#total' do
    it 'returns the total cost of the basket' do
      allow(menu).to receive(:price).with(:salad).and_return(4.75)
      allow(menu).to receive(:price).with(:soup).and_return(3.50)
      order.add(:salad, 1)
      order.add(:soup, 2)
      expect(order.total).to eq 11.75
    end
  end
end
