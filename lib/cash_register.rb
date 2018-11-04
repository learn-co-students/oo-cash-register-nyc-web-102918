require 'pry'
class CashRegister

   attr_accessor :discount, :total, :title, :price, :quantity, :items, :last_transaction
  # attr_reader :total
    # attr_writer :discount, , #:discount


  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end
  #
  # def discount
  #   @discount
  # end
  #
  # def total
  #   @total
  # end
  #
  #binding.pry

  def add_item(title, price, quantity = 1)
    @quantity = quantity

    if quantity > 1
      quantity.times do
        self.items << title
      end
    else
      self.items << title
    end

    @total += price * quantity
    self.last_transaction = price * quantity
  end


  def apply_discount
    @total = @total * (100 - @discount)/100 #discoutn is 20%
    return "There is no discount to apply." if @discount == 0
    return "After the discount, the total comes to $#{@total}."
  end

#binding.pry

  # def items # no need it.
  #   self.all_items
  # end

  def void_last_transaction
    self.total = self.total - self.last_transaction
  end
end
