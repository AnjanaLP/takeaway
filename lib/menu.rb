class Menu

  def initialize(items)
    @items = items
  end

  def view
    items
  end

  private

  attr_reader :items
end
