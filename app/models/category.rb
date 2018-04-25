class Category < ApplicationRecord
	has_many :products
	validates :name, presence: true
end

# class CreateCategories < ActiveRecord::Migration[5.1]
#   def change
#     create_table :categories do |t|
#       t.string :name
#       t.string :childof

#       t.timestamps
#     end
#   end
# end
