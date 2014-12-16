class AddUserAttributesToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :created_by, :integer
    add_column :authors, :last_edit, :integer
  end
end
