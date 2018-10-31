class CashRegister

  attr_accessor :total, :discount, :items, :prices

  def initialize(employee_discount = nil)
    @total = 0
    @items = []
    @prices = []
    @discount = employee_discount
  end

  def add_item(item, price, quantity = 1)
    self.total += price * quantity
    quantity.times do
     @items << item
     @prices << price * quantity
    end
  end

  def apply_discount
    if self.discount == nil
      "There is no discount to apply."
    else
      self.total -= self.total * (self.discount / 100.0)
      "After the discount, the total comes to $#{self.total.to_i}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    last_item = self.items.delete_at(-1)
    self.total -= self.prices.delete_at(-1)
  end

end
