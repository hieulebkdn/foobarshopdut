class PagesController < ApplicationController
	def home
	end

	def test_function
		@trendingProduct = Product.all.order(view: :desc).limit(5)
		@newestProduct = Product.all.order(created_at: :desc)
		@products = Product.all.limit(5)
		@brandLogos = Brand.all.limit(4)

	end

	def shop
		@products = Product.all.limit(5)
	end

	def single_product
	end
end
