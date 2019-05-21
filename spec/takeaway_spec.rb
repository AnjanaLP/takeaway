require 'takeaway'

describe Takeaway do
  subject(:takeaway)  { described_class.new(menu: menu) }
  let(:menu)          { double :menu, view: items  }
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
end
