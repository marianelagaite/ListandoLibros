class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :titulo
      t.datetime :fecha_publicacion
      t.string :descripcion
      t.float :promedio_calificacion, default: 0

      t.timestamps
    end
  end
end
