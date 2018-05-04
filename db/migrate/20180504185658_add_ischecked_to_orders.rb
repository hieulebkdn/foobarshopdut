class AddIscheckedToOrders < ActiveRecord::Migration[5.1]
	def up
		add_column :orders, :is_checked, :string, :default => "pending"
	end

	def down
		remove_column :admins, :is_checked
	end
end
