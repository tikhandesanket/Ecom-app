class Api::V1::CartsController < Api::V1::BaseController

	before_action :find_cart, only: [:update, :show]
	before_action :find_product, only: [:create]
	before_action :find_item, only: [:update]
	
	def create
		@cart = Cart.first ? Cart.first : Cart.new #as we don't have user so creating one cart only
		@cart.add_item(@product)
		@cart.save
	end

	def show

	end

	def update
		if params['quantity'].to_f <= 0
			@cart.remove_cart_item(@item)
		else
			@cart.update_item(@item, params['quantity'])
		end
		@cart.save
	end

	private
	def find_cart
		@cart = Cart.find_by_id(params[:id])
		unless  @cart
			render json: {status: "error", code: 422, message: ["Cart not found."], data: []}, status: :unprocessable_entity and return
		end
	end

	def find_product
		@product = Product.find_by_id(params['product_id'])
		unless  @product
			render json: {status: "error", code: 422, message: ["Product not found."], data: []}, status: :unprocessable_entity and return
		end
	end

	def find_item
		@item = @cart.items.find_by_id(params['item_id'])
		unless @item
			render json: {status: "error", code: 422, message: ["This line item is not in cart. please add to cart."], data: []}, status: :unprocessable_entity and return
		end
	end
end