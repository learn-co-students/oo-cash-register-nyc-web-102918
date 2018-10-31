require "pry"

class CashRegister

  attr_accessor :total, :discount, :title, :price, :quantity, :last_item
  attr_reader :items

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    @title = title
    @price = price
    @total += price * quantity
    @quantity = quantity

    quantity.times do
      @items << title
    end

    @last_item = self
  end

  def apply_discount
    if @discount != 0
      @total *= (100 - @discount) * 0.01
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_item.price
  end

end
