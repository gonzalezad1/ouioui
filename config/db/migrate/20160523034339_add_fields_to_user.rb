class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :image, :string
    add_column :users, :phone_number, :string
    add_column :users, :description, :text
    add_column :users, :interest, :text
  end
end
