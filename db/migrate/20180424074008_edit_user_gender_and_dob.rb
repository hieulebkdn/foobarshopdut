class EditUserGenderAndDob < ActiveRecord::Migration[5.1]
	def up
		change_column :users, :gender, :boolean, :default =>true
		change_column :users, :dob, :date, :default =>"1997-01-01"
	end

	def down
		change_column :users, :gender, :boolean
		change_column :users, :dob, :date
	end
end
