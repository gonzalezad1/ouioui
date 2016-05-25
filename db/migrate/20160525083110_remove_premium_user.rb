class RemovePremiumUser < ActiveRecord::Migration
  def change
  	remove_column :users, :premium_code
  end
end
