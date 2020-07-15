require 'pry'

class CashRegister

  attr_accessor :total, :discount, :items, :last_item

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_item = []
  end

  def add_item(title, price, quantity = 1)
    quantity.times do
      @items << title
      @last_item << price
    end
    @total = @total += price * quantity
    @total
  end

  def apply_discount
    if @discount != 0
      @total = @total *= (100 - @discount.to_f) / 100.to_f
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = @total -= @last_item[-1]
  end



end
