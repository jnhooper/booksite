class CreateContributors < ActiveRecord::Migration
  def change
    create_table :contributors do |t|
      t.belongs_to :author
      t.belongs_to :book
      t.timestamps
    end
  end
end
