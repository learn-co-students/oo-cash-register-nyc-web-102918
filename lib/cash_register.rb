require "pry"

class CashRegister
  attr_accessor :total, :discount, :item_list, :last

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @item_list = []
  end

  # class Item
  #   @@all_items = []
  #
  #   attr_accessor :title, :price, :quantity
  #
  #   def initialize(title, price, quantity)
  #     @title = title
  #     @price = price
  #     @quantity = quantity
  #
  #     @@all_items << self
  #   end
  #
  #
  #
  #   def all
  #     @@all_items
  #   end
  #
  # end
  #
  #

  # def add_item(title, price, quantity=1)
  #   self.item_list << {
  #     :title => title,
  #     :price => price,
  #     :quantity => quantity
  #   }
  #
  #   self.total += (price * quantity)
  #   self.total
  # end

  def add_item(title, price, quantity=1)
    quantity.times do
      self.item_list << {
        :title => title,
        :price => price
      }

      self.total += price
    end

    self.total
  end

  def apply_discount
    if self.discount == 0
      return "There is no discount to apply."
    else
      discount_amount = self.total * (self.discount * 0.01)
      self.total = self.total - discount_amount
      return  "After the discount, the total comes to $#{self.total.to_i}."
    end
  end

  def items
    self.item_list.map { |item| item[:title] }
  end

  def void_last_transaction
    self.total = self.total - self.item_list[-1][:price]
    self.item_list.pop
    self.total
  end




end
