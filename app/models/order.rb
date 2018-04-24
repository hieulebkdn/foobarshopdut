class Order < ApplicationRecord
	has_many :order_details
	# belongs_to :User

	# VALID_PHONE_REGEX = /\A0(1\d{9}|9\d{8})\z/
	validates :phone, presence: true

	# validates_format_of :phone,
 #      :with => /[0-9]{3}-[0-9]{3}-[0-9]{4}/,
 #      :message => "- Phone numbers must be in xxx-xxx-xxxx format."

	validates :shipname, :shipaddress, :city, presence: true 	
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
