class Cart < ApplicationRecord
	has_many :items

	def add_item(product, quantity=nil)
		item = self.items.build(product_id: product.id, name: product.name, price: product.price, discount: product.discount, quantity: quantity)
		item.calculate_prices
		update_cart_details
	end

	def update_item(item, quantity)
		item.calculate_prices(quantity)
		item.save
		update_cart_details
		
	end

	def remove_cart_item(item)
		item.destroy
		update_cart_details
	end

	def update_cart_details
		self.total_cost = self.items.collect(&:selling_price).sum
		self.total_discount = self.items.collect(&:total_discount).sum
	end
end
