class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
    	t.string :name
      t.references :cart, index: true
    	t.references :product, index: true
    	t.decimal :price
    	t.decimal :discount
    	t.decimal :selling_price
      t.timestamps
    end
  end
end
