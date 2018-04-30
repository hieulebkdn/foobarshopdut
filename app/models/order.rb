class Order < ApplicationRecord
	has_many :order_details
	# belongs_to :User
	has_many :line_items, :dependent => :destroy
	# VALID_PHONE_REGEX = /\A0(1\d{9}|9\d{8})\z/
	validates :phone, presence: true
	belongs_to :user
	# validates_format_of :phone,
 #      :with => /[0-9]{3}-[0-9]{3}-[0-9]{4}/,
 #      :message => "- Phone numbers must be in xxx-xxx-xxxx format."

	validates :shipname, :shipaddress, :city, presence: true 	

	def add_line_items_from_cart(cart) 
        cart.line_items.each do |item|
            item.cart_id = nil
            line_items << item
        end
    end	
    def total_price 
        line_items.to_a.sum { |item| item.total_price }
    end
end

# class CreateOrders < ActiveRecord::Migration[5.1]
#   def change
#     create_table :orders do |t|
#       t.integer :orderuserid
#       t.string :shipname
#       t.text :shipaddress
#       t.string :phone
#       t.string :city

#       t.timestamps
#     end
#   end
# end
