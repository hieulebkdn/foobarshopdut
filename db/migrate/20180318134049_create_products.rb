class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.decimal :price, null: false, precision: 15
      t.float :weight, precision: 5, scale: 2, null: false
      t.string :image
      t.integer :stock
      t.text :detail
      t.text :description
      t.string :warranty
      t.integer :rating
      t.string :cpu
      t.string :ram
      t.string :memory
      t.string :display

      t.timestamps
    end
  end
end
