class Product < ApplicationRecord

	# has_many :reviews
	# has_many :order_details
	# belongs_to :Admin
	# belongs_to :Brand, :Category, :Admin
	has_many :line_items
	validates :price, presence: true

	validates :stock, presence: true, numericality: {only_integer: true, less_than: 1000 }

	validates :weight, presence: true, numericality: true,
	:format => { :with => /\A\d{1,3}(\.\d{0,2})?\z/ }

	validates :price, presence: true,  :numericality => true,
	:format => { :with => /\A\d{1,9}(\.\d{0,2})?\z/ }

	validates :name, presence: true, length: { maximum: 255 }

	validates :rating, numericality: { greater_than: 0, less_than: 6 }
	
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  	has_many :line_items
    before_destroy :check_if_has_line_item
  
private
  
    def check_if_has_line_item
        if line_items.empty?
            return true
        else
            errors.add(:base, 'This product has a LineItem')
            return false
        end
    end
end



