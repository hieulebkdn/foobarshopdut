class Cart < ApplicationRecord

	#validates :quantity, presence: true,  numericality: { greater_than: 0, less_than: 100 }
	has_many :line_items, :dependent => :destroy
	def add_product(product_id)
        current_item = line_items.find_by_product_id(product_id)
        if current_item 
            current_item.quantity += 1
        else
            current_item = line_items.build(:product_id => product_id)
        end
        current_item
    end
end


# class CreateCarts < ActiveRecord::Migration[5.1]
#   def change
#     create_table :carts do |t|
#       t.integer :cartuserid
#       t.integer :cartproductid
#       t.integer :quantity

#       t.timestamps
#     end
#   end
# end

