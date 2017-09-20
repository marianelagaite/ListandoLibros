class CreateBookLists < ActiveRecord::Migration[5.1]
  def change
    create_table :book_lists do |t|
      t.string :nombre
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
