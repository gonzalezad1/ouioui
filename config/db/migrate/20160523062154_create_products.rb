class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_type
      t.string :category
      t.string :size
      t.string :product_name
      t.text :description
      t.integer :stock
      t.integer :price
      t.string :code_id
    end
  end
end
