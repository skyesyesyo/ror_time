class ShoesController < ApplicationController
	def index
		@shoes = Shoe.where("status = ?", 0)
		@users = User.all
		# @shoes = Shoe.all
	end

	def create
		@shoe = Shoe.new shoe_params
		puts shoe_params
		if @shoe.save
			redirect_to :back
		else
			flash[:errors] = @shoe.errors.full_messages
			redirect_to :back
		end
	end

	private
  	def shoe_params
  		params.require(:shoe).permit(:amount, :user_id, :product, :status)
  	end

end
