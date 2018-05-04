class AddIscheckedToOrders < ActiveRecord::Migration[5.1]
	def up
		add_column :orders, :is_checked, :boolean, :default => false
	end

	def down
		remove_column :orders, :is_checked
	end

end
