class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :content, null: false 
      t.integer :rating

      t.timestamps
    end
  end
end
