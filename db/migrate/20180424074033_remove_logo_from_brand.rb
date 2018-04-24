class RemoveLogoFromBrand < ActiveRecord::Migration[5.1]
	def up
		remove_column :brands, :logo
	end
	def down
		add_column :brands, :logo, :string
	end
end
