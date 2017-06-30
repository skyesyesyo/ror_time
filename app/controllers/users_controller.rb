class UsersController < ApplicationController
	# skip_before_action :require_login, only: [:new, :create]
	# before_action :require_correct_user, only: [:edit, :show, :update, :destroy]

  def index
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to :root
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @notsold = User.find(params[:id]).shoes.where("status = ?", 0)
    @sold = User.find(params[:id]).shoes.where("status = ?", params[:id])
    @sum = Shoe.where("user_id = ? and status = ?",params[:id], params[:id]).sum(:amount)

    # @seller = User.find(params[:id])
    @purchases = Shoe.where("status = ?", params[:id])

    @tpurchase = Shoe.where("status = ?", params[:id]).sum(:amount)
  end


  private
  	def require_correct_user
  		if current_user != User.find(params[:id])
  			redirect_to :root
  		end
  	end

  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  	end
end
