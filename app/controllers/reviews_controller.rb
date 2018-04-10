class ReviewsController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource
	def index
		@review = Review.all
	end
	def create
		@review =  Review.new(review_params) 
		@review.user_id = current_user.id
		respond_to do |format|
			if @review.save
				format.js
			else
				format.js
			end
		end
	end
	def destroy
		@review = Review.find(params[:id])
		@review.destroy
		respond_to do |format|
			format.js
		end
		# redirect_to product_path(@review.product_id),notice:"you have successfully deleted teh Review"
	end
	private
	 def review_params
	 		params[:review].permit(:body,:rating,:product_id)
	 end
end
