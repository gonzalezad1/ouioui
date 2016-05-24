class AddMissingTimestamps < ActiveRecord::Migration
  def change
    add_timestamps :conversations
    add_timestamps :messages
    add_timestamps :products
  end
end
