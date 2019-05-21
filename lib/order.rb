class Order

  attr_reader :basket

  def initialize(menu)
    @menu = menu
    @basket = Hash.new(0)
  end

  def add(dish, quantity)
    basket[dish] += quantity
  end

  def total
    basket.map do |dish, price|
        menu.price(dish) * price
    end.inject(:+)
  end

  def empty_basket?
    basket.empty?
  end

  private

  attr_reader :menu

end
