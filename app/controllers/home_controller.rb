class HomeController < ApplicationController
	def index
		@brandLogos = Brand.all
		@trendingProduct = Product.all.order(view: :desc).limit(5)
		@lastestProduct = Product.all.order(created_at: :desc)
		@cart = current_cart
	end
end
