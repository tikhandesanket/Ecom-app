class Item < ApplicationRecord
	belongs_to :cart, counter_cache: true
	belongs_to :product

	def calculate_prices(quantity=nil)
		self.quantity = quantity.to_f if quantity
		self.total_discount = ((self.price.to_f*self.quantity.to_f)/100)*self.discount.to_f
		self.selling_price = (self.price.to_f*self.quantity.to_f) - self.total_discount.to_f
	end

end
