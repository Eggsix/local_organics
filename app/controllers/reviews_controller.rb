class ReviewsController < ApplicationController

	def create
		user = User.find(current_user.id)
		review = user.reviews.create(review_params)
		redirect_to market_path(params[:market_id])
	end

	def destroy 
		market = Market.find(params[:market_id])
		review = market.reviews.find(params[:id])
		review.destroy
		redirect_to market_path(params[:market_id])
	end

	private

	def review_params
    	params.require(:review).permit(:content).merge(:market_id => params[:market_id])
  	end
end