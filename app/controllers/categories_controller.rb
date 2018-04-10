class CategoriesController < ApplicationController	 
	# before_action :authenticate_user!,except: [:index,:show]
	# load_and_authorize_resource ##nvoke ability class
	def index
		@categories = Category.all
	end
	def new
		@category = Category.new
	end
	def create
		@category = Category.new(params[:category].permit(:name,))
		@category.save
		respond_to do |format|
			format.js
		end
	end
	def show	
		@wishlist = Wishlist.new
		@category = Category.find(params[:id])
	end
	def edit
		@category = Category.find(params[:id])
	end
	def update
		@category = Category.find(params[:id])
		if @category.update_attributes(params[:category].permit(:name))
			redirect_to categories_path,notice:"successfully created"
		else
			render action: 'edit'
		end
	end
	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to categories_path
	end
	def check_category
		@category = Category.find_by(name:params[:category])
		render json: @category.nil? ? {error:true} : {error:false}
	end
end
