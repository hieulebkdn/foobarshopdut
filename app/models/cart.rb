class Cart < ApplicationRecord

	#validates :quantity, presence: true,  numericality: { greater_than: 0, less_than: 100 }
	has_many :line_items, :dependent => :destroy
	def add_product(product_id, quantity)
        current_item = line_items.find_by_product_id(product_id)
        if current_item 
            current_item.quantity += quantity.to_i
        else
            current_item = line_items.build(:product_id => product_id)
            current_item.quantity = quantity
        end
        current_item
    end
    def total_price 
        line_items.to_a.sum { |item| item.total_price }
    end
    def total_item 
        line_items.to_a.sum { |item| item.quantity }
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

