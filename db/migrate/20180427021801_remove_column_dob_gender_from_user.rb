class RemoveColumnDobGenderFromUser < ActiveRecord::Migration[5.1]
	def up
		remove_column :users, :dob
		remove_column :users, :gender
	end

	def down
		add_column :users, :dob, :boolean, :default => true
		add_column :users, :dob, :date, :default =>"1997-01-01"
	end
end
