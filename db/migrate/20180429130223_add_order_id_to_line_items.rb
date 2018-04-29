class AddOrderIdToLineItems < ActiveRecord::Migration[5.1]
	def up
		add_column :line_items, :order_id, :integer
	end

	def down
		remove_column :line_items, :order_id
	end
end
