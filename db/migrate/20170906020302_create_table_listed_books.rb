class CreateJoinTableListedBooks < ActiveRecord::Migration[5.1]
  def self.up
    create_table :listed_books do |t|
      t.references :book, :book_list

      t.timestamps
    end
  end
  
  def self.down
    drop_table :listed_books
  end
end
