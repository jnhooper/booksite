class AddBookAttributesToBook < ActiveRecord::Migration
  def change
    add_column :books, :title, :string
    # add_column :books, :author, :integer
    add_column :books, :description, :text
    add_column :books, :genre, :string
    add_column :books, :price, :decimal
    add_column :books, :release_date, :string
    add_column :books, :isbn, :string
    add_column :books, :purchase_link, :string
  end
end
