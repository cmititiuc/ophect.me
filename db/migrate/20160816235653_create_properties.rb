class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :key
      t.text :value

      t.timestamps null: false
    end
    add_index :properties, :key, :unique => true
  end
end
