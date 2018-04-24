class RemoveWarrantyFromProduct < ActiveRecord::Migration[5.1]
	def up
		remove_column :products, :warranty
	end
	def down
		add_column :products, :warranty, :string
	end
end
