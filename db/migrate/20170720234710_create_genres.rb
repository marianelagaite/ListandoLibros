class CreateGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :genres do |t|
      t.string :nombre
      t.string :descripcion

      t.timestamps
    end
  end
end