class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.string :comprador
      t.text :descripcion_del_item
      t.float :precio_del_item
      t.integer :total_de_items
      t.string :direccion_del_vendedor
      t.string :vendedor
      t.references :user
      t.timestamps
    end
  end
end
