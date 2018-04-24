class AddGpuViewToProduct < ActiveRecord::Migration[5.1]
	def up
		add_column :products, :gpu, :string
		add_column :products, :view, :integer, :default =>0
	end

	def down
		remove_column :products, :gpu
		remove_column :products, :view
	end
end
