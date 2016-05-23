class CreateProductPhotos < ActiveRecord::Migration
  def change
    create_table :product_photos do |t|
      t.references :products, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
