class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.text :item_description
      t.string :item_name
      t.integer :item_price
      t.string :image_id
      t.boolean :is_sale_status, default: false, null: false

      t.timestamps
    end
  end
end
