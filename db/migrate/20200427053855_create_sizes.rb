class CreateSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :sizes do |t|
      t.float :size
      t.boolean :is_active_size, default: false, null: false

      t.timestamps
    end
  end
end
