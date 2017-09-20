class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :titulo
      t.text :descripcion
      t.timestamps
    end
  end
end
