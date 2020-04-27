class AddCartItemSizeToCartItems < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_items, :cart_item_size, :float
  end
end
