class WishlistsController < ApplicationController
	def index
		@wishlist = Wishlist.all
	end
	def create
		@wishlist = Wishlist.new(wishlist_params)
		@wishlist.user_id = current_user.id
		if @wishlist.save
			
			redirect_to products_path,notice:"added to wishlist"
		end
	end
	private 
	def wishlist_params
		params[:wishlist].permit(:product_id)
	end
end
