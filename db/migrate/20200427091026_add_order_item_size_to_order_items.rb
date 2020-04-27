class AddOrderItemSizeToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :order_item_size, :float
  end
end
