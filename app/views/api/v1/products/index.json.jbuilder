if @products.present?
	json.status "success"
	json.code 200
	json.message ["Products found."]
	json.data @products do |product| 
		json.(product, :id, :name, :price, :discount, :created_at)
	end
else
	json.status "error"
	json.code 204
	json.message ["Products not found."]
	json.data []
end