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
end
