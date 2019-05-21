require_relative 'order'

class Takeaway

  def initialize(menu:, order: Order.new(menu))
    @menu = menu
    @order = order
  end

  def view_menu
    menu.view
  end

  def choose(dish, quantity)
    raise "Cannot add #{dish}: it is not on the menu" unless menu.has_dish?(dish)
    raise "Cannot add #{dish}: invalid quantity chosen" if invalid?(quantity)
    order.add(dish, quantity)
    basket_summary
  end

  def view_total
    order.total
  end

  private

  attr_reader :menu, :order

  def basket_summary
    order.basket
  end

  def invalid?(quantity)
    quantity <= 0
  end
end
