class AddFullnameToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :fullname, :string
  end
end
