describe 'User Stories' do
  let(:takeaway)    { Takeaway.new(menu: menu) }
  let(:menu)        { Menu.new(items) }
  let(:items)       { { salad: 4.75, soup: 3.50, sandwich: 6.25 } }

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'customer can view the menu items with dishes and prices' do
    expect(takeaway.view_menu).to eq items
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'customer can choose dishes with quantity to add to their basket' do
    expect(takeaway.choose(:salad, 3)).to eq(salad: 3)
  end

  context 'when chosen dish is not on the menu' do
    it 'raises an error' do
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
