class RemoveOrderItemSizeFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :order_item_size, :float
  end
end
