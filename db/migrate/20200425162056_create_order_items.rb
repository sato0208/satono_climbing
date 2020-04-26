class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :product_status, default: 0, null: false
      t.integer :order_item_price
      t.integer :order_item_quantity
      t.string :order_item_name

      t.timestamps
    end
  end
end
