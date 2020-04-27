class AddCartItemsToCartItemSizes < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_items, :cart_item_size, :integer
  end
end
