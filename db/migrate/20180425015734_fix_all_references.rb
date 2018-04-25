class FixAllReferences < ActiveRecord::Migration[5.1]
	def up
		remove_reference :reviews, :user, index: true, foreign_key: true
		remove_reference :orders, :user, index: true, foreign_key: true
		remove_reference :order_details, :orders, index: true, foreign_key: true
		remove_reference :reviews, :products, index: true, foreign_key: true
		remove_reference :order_details, :products, index: true, foreign_key: true
		remove_reference :products, :brands, index: true, foreign_key: true
		remove_reference :products, :categories, index: true, foreign_key: true
		remove_reference :products, :admins, index: true, foreign_key: true

	end

	def down
		add_reference :reviews, :user, index: true, foreign_key: true
		add_reference :orders, :user, index: true, foreign_key: true
		add_reference :order_details, :orders, index: true, foreign_key: true
		add_reference :reviews, :products, index: true, foreign_key: true
		add_reference :order_details, :products, index: true, foreign_key: true
		add_reference :products, :brands, index: true, foreign_key: true
		add_reference :products, :categories, index: true, foreign_key: true
		add_reference :products, :admins, index: true, foreign_key: true
	end
end
