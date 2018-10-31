require 'pry'
class CashRegister
attr_accessor :total, :discount, :items


  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    quantity.times  do
      @items << title
    end
    if quantity != 1
      self.total += (price*quantity)
    else
    @total += price
    end
    @last_transaction = price*quantity
  end

  def apply_discount
    if @discount == 0
       "There is no discount to apply."
    else
      self.total = (total * ((100.0 - discount.to_f)/100)).to_i
       "After the discount, the total comes to $#{self.total}."
    end
  end


  def void_last_transaction
self.total = self.total - @last_transaction
  end

end
