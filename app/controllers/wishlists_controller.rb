class WishlistsController < ApplicationController
	def index
		@wishlist = Wishlist.all
		@cart_line_item = CartLineItem.new
	end
	def create
		@cart_line_item = CartLineItem.new
		@wishlist = Wishlist.new(wishlist_params)
		@wishlist.user_id = current_user.id
		@wishlists =  Wishlist.where(product_id:params["wishlist"]["product_id"],user_id:current_user.id)
		if @wishlists.count < 1
			if @wishlist.save
				respond_to do |format|
					format.js
				end	
			end
		else
			respond_to do |format|
					format.js
			end	
		end
	end
	private 
	def wishlist_params
		params[:wishlist].permit(:product_id)
	end
end
