class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id ,null: false
      t.string :item_name ,null: false
      t.text :item_description ,null: false
      t.string :price ,null: false
      t.boolean :sale_status , default: true, null: false
      
      t.timestamps
    end
  end
end
