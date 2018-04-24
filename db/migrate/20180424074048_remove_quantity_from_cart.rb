class RemoveQuantityFromCart < ActiveRecord::Migration[5.1]
	def up
		remove_column :carts, :quantity
	end

	def down 
		add_column :carts, :quantity, :integer
	end
end
