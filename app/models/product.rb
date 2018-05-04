class Product < ApplicationRecord
	# scope :today, where(:transfer_date => Date.today...Date.tomorrow)
	scope :above_rating, ->(rate){where "rating > ?", rate}

	scope :belong_to_brand, (lambda do |b_id| 
		if b_id != "0"
			where "brand_id == ?", b_id
		else
			all
		end
	end)

	scope :price_range, (lambda do |price_option| 
		if price_option == "1"
			where "price BETWEEN '0' AND '1000'"
		elsif price_option == "2"
			where "price BETWEEN '1000' AND '2000'"
		elsif price_option == "3"
			where "price BETWEEN '2000' AND '3000'"
		else
			all
		end
	end)

	scope :belong_to_cate, -> (c_id_list) {where "category_id in (?)", c_id_list}

	has_many :reviews
	belongs_to :category
	belongs_to :brand

	has_many :line_items
	validates :price, presence: true

	validates :stock, presence: true, numericality: {only_integer: true, less_than: 1000 }

	validates :weight, presence: true, numericality: true,
	:format => { :with => /\A\d{1,3}(\.\d{0,2})?\z/ }

	validates :price, presence: true,  :numericality => true,
	:format => { :with => /\A\d{1,9}(\.\d{0,2})?\z/ }

	validates :name, presence: true, length: { maximum: 255 },uniqueness: { case_sensitive: false }

	validates :rating, numericality: { greater_than: 0, less_than: 6 }
	
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ":styles/laptop.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	has_many :line_items
	before_destroy :check_if_has_line_item

	class << self
		def import_file file
			spreadsheet = Roo::Spreadsheet.open file
			header = spreadsheet.row(1)
			rows = []
			(2..spreadsheet.last_row).each do |i|
				rows << spreadsheet.row(i)
			end
			import! header, rows
		end
	end
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

def self.search(search)
	if search
		find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	else
		find(:all)
	end
end

