class HomeController < ApplicationController
	def index
		@brandLogos = Brand.all
		@trendingProduct = Product.all.order(view: :desc).limit(5)
		@newestProduct = Product.all.order(created_at: :desc)
	end

	def new
	end

	def show
	end

	def destroy
	end
end
