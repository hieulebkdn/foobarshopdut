class CreateBrands < ActiveRecord::Migration[5.1]
  def change
    create_table :brands do |t|
      t.string :name, null: false
      t.text :description
      t.string :logo

      t.timestamps
    end
  end
end
