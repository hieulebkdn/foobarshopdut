class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.string :name, null: false
      t.string :email, null: false 
      t.string :phone, null: false
      t.string :company, null: false
      t.string :address, null: false
      t.integer :rating

      t.timestamps
    end
  end
end
