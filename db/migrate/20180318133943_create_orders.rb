class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :shipname, null: false
      t.text :shipaddress, null: false
      t.string :phone, null: false
      t.string :city, null: false

      t.timestamps
    end
  end
end
