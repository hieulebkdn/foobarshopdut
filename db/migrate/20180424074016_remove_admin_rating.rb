class RemoveAdminRating < ActiveRecord::Migration[5.1]
	def up
		remove_column :admins, :rating
	end
	def down
		add_column :admins, :rating, :integer
	end
end
