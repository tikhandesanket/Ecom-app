class RenameDbFields < ActiveRecord::Migration[6.0]
  def change
  	rename_column :carts, :discount_price, :total_discount
  	rename_column :items, :discounted_price, :total_discount
  	rename_column :carts, :total_price, :total_cost
  end
end
