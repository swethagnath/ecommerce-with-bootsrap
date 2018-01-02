class ProductsController < ApplicationController

before_action :authenticate_user!,except: [:index,:show]

load_and_authorize_resource ##nvoke ability class

	#url - http://localhost:3000/products
	#uri - /products
	#path - products_path
	#http method - Get
	#roles and resposiblity - to list all products 
	def index
		@products = Product.all
		@cart_line_item = CartLineItem.new
	end
	#url - http://localhost:3000/products/new
	#uri - /products/new
	#path - new_product_path
	#http method - Get
	#roles and resposiblity - is to setup a form for adding a new product
	def new
		@product = Product.new
	end
	
	#url - http://localhost:3000/products
	#uri - /products
	#path - products_path
	#http method - post
	#roles and resposiblity - take the data coming from the form pass it to the constructor
	#as an argument validate the object if the validation passes insert the record in the db
	#redirect the user to a new page else dipsly the error on the form
	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to product_path(@product.id) ,notice:"the product was successfully created"
		else
			render action: 'new'
		end
	end
	#url - http://localhost:3000/products/:id
	#uri - /products/:id
	#path - products_path(:id)
	#http method - get
	#roles and resposiblity - to find the product from the database and display it on the show
	#page,this page will be used to show all the data about a product and also associated information
	#like all reviews ,all q&a's, add product to cart
	def show
		#begin
			# @product = Product.find(params[:id])
			# @review =  Review.new
		#rescue ActiveRecord::RecordNotFound
			#redirect_to products_path,notice:"record not found"
		#end
	    #begin
		 	# @product = Product.find_by(params[:id])
		 	# @review =  Review.new
		# 	if @product.nil?
				#redirect_to products_path,notice:"record not found"
		#	end
		 #end
		 @product = Product.find(params[:id])
		 @review =  Review.new
		 @wishlist = Wishlist.new
	end
	#url - http://localhost:3000/products/:id/edit
	#uri - /products/:id/edit
	#path - edit_products_path(:id)
	#http method - get
	#roles and resposiblity - to find the record the user is trying to edit,and display it on a form
	def edit
		@product = Product.find(params[:id]) #record for edit
	end
	#url - http://localhost:3000/products/:id
	#uri - /products/:id
	#path - products_path(:id)
	#http method - patch
	#roles and resposiblity - find the record,the user just updated in the browser ,and update in the 
	#browser and update its information by taking the data coming in from the form ,validate the object
	#,if the validation pass update the record to the db and redirect the user to a show page ,else display
	#the error in the form
	def update
		@product = Product.find(params[:id])
			if @product.update_attributes(product_params)
				redirect_to product_path(@product.id),notice:"the product was successfully updated"
			else
				render action: 'edit'
			end
	end
	#url - http://localhost:3000/products/:id
	#uri - /products/:id
	#path - products_path(id)
	#http method - delete 
	#roles and resposiblity - find the record the user is trying to delete and destroy the record
	#and redirect the user to a index page
	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_path, notice:"the product was successfully destroyed"	     
    end

    #private  method we created manually
    private
    	def product_params
    		params[:product].permit(:name,:description,:price,:stock,:category_id,:cod_eligible,:feature_image_url)
    	end
end
