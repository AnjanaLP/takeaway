require 'printer'

describe Printer do

  it 'prints the order confirmation' do
    expect(Printer.print_confirmation).to eq "Order received!"
  end
end
