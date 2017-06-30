class HistorysController < ApplicationController

	def create
		@history = History.new history_params
		@shoe = Shoe.find(params[:history][:shoe_id])
		if @history.save
			@shoe.update(status: params[:history][:user_id])
			@shoe.update(updated_at: DateTime.now)
			redirect_to :back
		else
			flash[:errors] = @history.errors.full_messages
			redirect_to :back
		end
	end

	private
  	def history_params
  		params.require(:history).permit(:shoe_id, :user_id)
  	end

end
