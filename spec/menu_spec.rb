require 'menu'

describe Menu do
  subject(:menu)  { described_class.new(items ) }
  let(:items)     { { salad: 4.75, soup: 3.50, sandwich: 6.25 } }

  describe '#view' do
    it 'displays the items with dishes and prices'do
      expect(menu.view).to eq items
    end
  end
end
