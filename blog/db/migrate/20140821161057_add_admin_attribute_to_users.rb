class AddAdminAttributeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :isAdmin, :boolean
  end
end
