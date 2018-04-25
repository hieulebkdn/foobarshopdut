class FixReview < ActiveRecord::Migration[5.1]
	def up
		remove_reference :reviews, :user, index: true, foreign_key: true
		add_column :reviews, :reviewer_name, :string
	end

	def down
		add_reference :reviews, :user, index: true, foreign_key: true
		remove_column :reviews, :reviewer_name, :string
	end
end
