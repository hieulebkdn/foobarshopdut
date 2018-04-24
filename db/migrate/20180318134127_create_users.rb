class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.boolean :gender, null: false
      t.date :dob, null: false

      t.timestamps
    end
  end
end
