class DropTableOrderDetails < ActiveRecord::Migration[5.1]
	def up
		drop_table :order_details
	end

	def down
		fail ActiveRecord::IrreversibleMigration
	end
end
