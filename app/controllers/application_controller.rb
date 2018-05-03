class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	protect_from_forgery prepend: true
	include SessionsHelper

    helper_method [:recent_products, :current_cart]

    def recent_products
      @recent_products ||= RecentProducts.new cookies
    end

	private 
    
	def current_cart
        Cart.find(cookies.signed[:cart_id])
    rescue ActiveRecord::RecordNotFound
        cart = Cart.create
        cookies.permanent.signed[:cart_id] = cart.id
        cart
    end
end
##TEST CHAU