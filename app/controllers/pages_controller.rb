class PagesController < ApplicationController
	def home
	end

	def test_function
		@products = Product.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
	end

	def shop
		@products = Product.all.limit(5)
	end

	def single_product
	end
end
