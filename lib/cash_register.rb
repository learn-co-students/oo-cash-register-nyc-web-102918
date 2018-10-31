require('pry')
class CashRegister
	 attr_accessor :total,:items, :discount
	
	def initialize(discount=nil)
		@discount=discount
		@total=0
		@items=[]
		@last=nil
		@cost=0
	end
	def add_item(title,price,quantity=1)
		@last={item:title, price: price, quantity: quantity}
		quantity.times{@items << title}
		@cost=price*quantity
		@total+=@cost
	end
	
	def void_last_transaction
		@last[:quantity].times{@items.pop}
			@total-=@last[:price]*@last[:quantity]
	end


	def apply_discount
		if @discount
		@total=@total*(100-discount)/100
		return "After the discount, the total comes to $#{@total}."
		else
		"There is no discount to apply."
		end
		
	end
	
end