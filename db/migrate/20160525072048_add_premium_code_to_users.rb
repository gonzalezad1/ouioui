class AddPremiumCodeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :premium_code, :string
  end
end
