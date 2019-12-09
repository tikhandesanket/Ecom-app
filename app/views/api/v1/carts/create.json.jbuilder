if @cart.present? && @cart.errors.empty?
	json.status "success"
	json.code 200
	json.message ["Item added in cart successfully."]
	json.data do 
		json.(@cart, :id, :total_cost, :total_discount, :items_count, :items)
	end
else
	json.status "error"
	json.code 422
	json.message [@cart.errors.messages]
	json.data []
end