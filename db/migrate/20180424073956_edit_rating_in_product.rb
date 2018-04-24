class EditRatingInProduct < ActiveRecord::Migration[5.1]
	def up
		change_column :products, :rating, :integer, :default =>5 
	end
	def down
		change_column :products, :rating, :integer
	end
end
