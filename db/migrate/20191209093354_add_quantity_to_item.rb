class AddQuantityToItem < ActiveRecord::Migration[6.0]
  def change
  	add_column :items, :quantity, :integer, default: 0
  	add_column :items, :discounted_price, :decimal, precision: 5, scale: 2
  end
end
