class CreateJims < ActiveRecord::Migration[5.2]
  def change
    create_table :jims do |t|
      t.string :jim_address
      t.string :jim_name
      t.string :jim_access
      t.text :jim_description
      t.string :jim_image_id

      t.timestamps
    end
  end
end
