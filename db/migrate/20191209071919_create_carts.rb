class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
    	t.decimal :total_price, precision: 7, scale: 2
    	t.decimal :discount_price, precision: 7, scale: 2
    	t.integer :items_count
      t.timestamps
    end
  end
end
