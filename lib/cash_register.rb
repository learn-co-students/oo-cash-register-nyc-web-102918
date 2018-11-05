require 'pry'
class CashRegister
  attr_accessor :discount, :total, :last_transaction

  def initialize(discount = 0)#optionally takes an employee discount on initialization'
    @total = 0 #'sets an instance variable @total on initialization to zero'
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    quantity.times do |item|
      @items << title
    end
    @last_transaction = price
  end

  def apply_discount
    if @discount == 0
      return 'There is no discount to apply.'
    end
    @total -= @total * @discount / 100 #'applies the discount to the total price'
    return "After the discount, the total comes to $#{@total}." #'returns success message with updated total'
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @last_transaction
  end



end #class CashRegister
