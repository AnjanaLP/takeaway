class Menu

  def initialize(items)
    @items = items
  end

  def view
    items
  end

  def has_dish?(dish)
    !items[dish].nil?
  end

  private

  attr_reader :items
end
