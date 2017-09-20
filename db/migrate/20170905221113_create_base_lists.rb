class CreateBaseLists < ActiveRecord::Migration[5.1]
  def change
    create_table :base_lists do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
