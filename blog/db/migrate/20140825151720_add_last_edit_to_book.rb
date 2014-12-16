class AddLastEditToBook < ActiveRecord::Migration
  def change
    add_column :books, :last_edit, :integer
  end
end
