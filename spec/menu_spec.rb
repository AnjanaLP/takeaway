require 'menu'

describe Menu do
  subject(:menu)  { described_class.new(items ) }
  let(:items)     { { salad: 4.75, soup: 3.50, sandwich: 6.25 } }

  describe '#view' do
    it 'displays the items with dishes and prices'do
      expect(menu.view).to eq items
    end
  end

  describe '#has_dish?' do
    it 'knows if a dish is on the menu' do
      expect(menu.has_dish?(:salad)).to be true
    end

    it 'knows if a dish is not on the menu' do
      expect(menu.has_dish?(:pizza)).to be false
    end
  end

  describe '#price' do
    it 'returns the price of a dish' do
      expect(menu.price(:salad)).to eq 4.75
    end
  end
end
