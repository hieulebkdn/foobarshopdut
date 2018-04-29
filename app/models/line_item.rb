class LineItem < ApplicationRecord
	belongs_to :cart or :order
	belongs_to :product
    
    def total_price
        product.price * quantity
    end
end
