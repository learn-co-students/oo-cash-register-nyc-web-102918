require 'pry'
class CashRegister

  def initialize(discount = 0)
    @total = 0
    @discount = discount
  end

  def discount
    @discount
  end

  def total
    @total
  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    @quantity = quantity
  end

  def apply_discount
    #binding.pry
    @total = @total * (100 - @discount)/100 #20%
    #binding.pry
  end

  def items
    #items << title
  end

  def void_last_transaction
    #self.total = 0
  end
end
