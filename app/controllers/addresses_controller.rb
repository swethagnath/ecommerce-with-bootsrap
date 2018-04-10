class AddressesController < ApplicationController
	def index
		@addresses = current_user.addresses
		@address = Address.new
	end
	def new
		@address = Address.new
	end
	def create
		 @address = Address.new(address_params)
		@address.user_id = current_user.id
		@address.save
		respond_to do |format|
			format.js
		end
	end
	def edit
		@address = Address.find(params[:id])
	end
	def update
		@address = Address.find(params[:id])
		if @address.update_attributes(address_params)
			redirect_to addresses_path
		else
			render action:'edit'
		end
	end
	def destroy
		@address = Address.find(params[:id])
		@address.destroy
		redirect_to addresses_path,notice:"successfully deleted"
	end
	private
	def address_params
		params[:address].permit(:name,:pincode,:street,:landmark,:city)
	end
end
