class FixAllReferencesAgain < ActiveRecord::Migration[5.1]
	def up
		add_reference :reviews, :user, index: true, foreign_key: true
		add_reference :orders, :user, index: true, foreign_key: true
		add_reference :order_details, :order, index: true, foreign_key: true
		add_reference :reviews, :product, index: true, foreign_key: true
		add_reference :order_details, :product, index: true, foreign_key: true
		add_reference :products, :brand, index: true, foreign_key: true
		add_reference :products, :category, index: true, foreign_key: true
		add_reference :products, :admin, index: true, foreign_key: true
	end

	def down
		remove_reference :reviews, :user, index: true, foreign_key: true
		remove_reference :orders, :user, index: true, foreign_key: true
		remove_reference :order_details, :order, index: true, foreign_key: true
		remove_reference :reviews, :product, index: true, foreign_key: true
		remove_reference :order_details, :product, index: true, foreign_key: true
		remove_reference :products, :brand, index: true, foreign_key: true
		remove_reference :products, :category, index: true, foreign_key: true
		remove_reference :products, :admin, index: true, foreign_key: true
	end

end
