class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.string :website
      t.string :middle_name
      t.string :nickname
      t.string :bio

      t.timestamps
    end
  end
end
