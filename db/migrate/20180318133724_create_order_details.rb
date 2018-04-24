class CreateOrderDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :order_details do |t|
      t.decimal :price, null: false, precision: 15
      t.integer :quantity, null: false
      t.string :status
      t.text :userrequest
      t.date :shipday

      t.timestamps
    end
  end
end
