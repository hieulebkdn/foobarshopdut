class CreateLineItems < ActiveRecord::Migration[5.1]
	def up
		create_table :line_items do |t|
			t.integer :product_id
			t.integer :cart_id

			t.timestamps
		end
	end

	def down 
		drop_table :line_items	
	end
end
