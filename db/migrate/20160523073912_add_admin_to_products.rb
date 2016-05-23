class AddAdminToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :admin, index: true, foreign_key: true
  end
end
