class OrderDetail < ApplicationRecord

	# belongs_to :Order, :Product

	validates :price, presence: true , numericality: true,
            :format => { :with => /\A\d{1,15}?\z/ }

	validates :quantity, presence: true , numericality: { only_integer: true, greater_than: 0, less_than: 100 }

end



