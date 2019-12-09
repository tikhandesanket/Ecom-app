if @cart.present?
	json.status "success"
	json.code 200
	json.message ["Cart Details"]
	json.data do 
		json.(@cart, :id, :total_cost, :total_discount, :items_count, :items)
	end
else
	json.status "error"
	json.code 422
	json.message ["Cart not found"]
	json.data []
end