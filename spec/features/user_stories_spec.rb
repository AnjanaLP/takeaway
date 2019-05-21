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
  it 'customer can choose dishes with quantity' do
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

  # As a customer
  # So that I know how much I am spending
  # I would like to check the total sum of the dishes I have selected
  it 'customer can check the total sum of their chosen dishes' do
    takeaway.choose(:salad, 1)
    takeaway.choose(:soup, 2)
    expect(takeaway.view_total).to eq 11.75
  end

  # As a customer
  # So that I can confirm my selected dishes
  # I would like to submit my order and receive confirmation it has been received
  it 'customer can submit their order and receive confirmation' do
    takeaway.choose(:salad, 1)
    expect(takeaway.submit_order).to eq "Order received!"
  end

    context 'when no items chosen' do
      it 'submitting an order raises an error' do
        message = "Cannot submit order: no items chosen"
        expect{ takeaway.submit_order }.to raise_error message
      end
    end
end
