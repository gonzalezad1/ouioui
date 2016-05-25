class AddPremiumToUsers < ActiveRecord::Migration
 def self.up
    add_column :users, :premium, :boolean
  end

  def self.down
    remove_column :users, :premium_code
  end
end
