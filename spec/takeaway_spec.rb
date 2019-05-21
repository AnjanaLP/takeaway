require 'takeaway'

describe Takeaway do
  subject(:takeaway)  { described_class.new(menu: menu, order: order) }
  let(:menu)          { double :menu, view: items, has_dish?: true  }
  let(:order)         { double :order, basket: { salad: 3 }, total: 11.75, add: nil }
  let(:items)         { { salad: 4.75, soup: 3.50, sandwich: 6.25 } }

  describe '#view_menu' do
    it 'calls the menu to display its items' do
      expect(menu).to receive(:view)
      takeaway.view_menu
    end

    it 'displays the menu items' do
      expect(takeaway.view_menu).to eq items
    end
  end

  describe '#choose' do
    it 'calls the order to add the items to the basket' do
      expect(order).to receive(:add).with(:salad, 3)
      takeaway.choose(:salad, 3)
    end

    it 'returns the basket with the chosen dish(es) added' do
      expect(takeaway.choose(:salad, 3)).to eq(salad: 3)
    end

    context 'when chosen dish is not on the menu' do
      it 'raises an error' do
        allow(menu).to receive(:has_dish?).with(:pizza).and_return false
        message = "Cannot add pizza: it is not on the menu"
        expect{ takeaway.choose(:pizza, 1) }.to raise_error message
      end
    end

    context 'when chosen quantity is invalid' do
      it 'raises an error' do
        message = "Cannot add salad: invalid quantity chosen"
        expect{ takeaway.choose(:salad, 0) }.to raise_error message
      end
    end
  end

  describe '#view_total' do
    it 'returns the total sum of the selected dishes' do
      takeaway.choose(:salad, 1)
      takeaway.choose(:soup, 2)
      expect(takeaway.view_total).to eq 11.75
    end
  end
end
