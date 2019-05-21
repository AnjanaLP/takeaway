require_relative 'order'
require_relative 'printer'

class Takeaway

  def initialize(menu:, order: Order.new(menu), printer: Printer)
    @menu = menu
    @order = order
    @printer = printer
  end

  def view_menu
    menu.view
  end

  def choose(dish, quantity)
    raise "Cannot add #{dish}: it is not on the menu" unless menu.has_dish?(dish)
    raise "Cannot add #{dish}: invalid quantity chosen" if invalid?(quantity)
    order.add(dish, quantity)
    order.basket
  end

  def view_total
    order.total
  end

  def submit_order
    raise "Cannot submit order: no items chosen" if order.empty_basket?
    printer.print_confirmation
  end

  private

  attr_reader :menu, :order, :printer

  def invalid?(quantity)
    quantity <= 0
  end
end
