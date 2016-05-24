class FixColName < ActiveRecord::Migration
  def self.up
    rename_column :product_photos, :products_id, :product_id

  end
end
