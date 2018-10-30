class CashRegister
	attr_accessor :total
	attr_reader :discount, :items
	def initialize(discount = 0)
		@total = 0
		@items = []
		@discount = discount
	end

	def add_item(item, price, quantity = 1)
		@total += price * quantity
		@last = [price, quantity]
		quantity.times do
			@items << item
		end
	end

	def apply_discount
		return "There is no discount to apply." unless @discount > 0
		@total -= @total * (@discount / 100.0)

		"After the discount, the total comes to $#{@total.to_i}."
	end

	def void_last_transaction
		@last[1].times do
			@items.pop
		end
		@total -= @last[0] * @last[1]
	end
end
