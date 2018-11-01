# We're going to create an Object Oriented Cash Register that can:
# Add items of varying quantities and prices
# Calculate discounts
# Keep track of what's been added to it
# Void the last transaction

class CashRegister

  # #total
  #   returns the current total

  attr_accessor:total,:discount,:items


  #   ::new
  #   sets an instance variable @total on initialization to zero
  #   optionally takes an employee discount on initialization
  def initialize(discount=0)
    @total=0
    @discount=discount
    @items=[]
  end

  #   #add_item
  #   accepts a title and a price and increases the total
  #   also accepts an optional quantity
  #   doesn't forget about the previous total
  def add_item (title, price, quantity=1)
    self.total += price * quantity
    quantity.times do
      @items << title
    end
  end



  #   #items
  #   returns an array containing all items that have been added


  #   #apply_discount
  #   the cash register was initialized with an employee discount
  #   applies the discount to the total price
  #   returns success message with updated total
  #   reduces the total
  #   the cash register was not initialized with an employee discount
  #   returns a string error message that there is no discount to apply
  def apply_discount
  if discount !=0
    self.total = total- (total*(discount/100.to_f)).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end


  # #void_last_transaction
  #   subtracts the last transaction from the total
  def void_last_transaction
    @total-=self.total
  end


end
