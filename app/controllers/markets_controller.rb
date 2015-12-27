class MarketsController < ApplicationController
	def show
		@market = Market.find(params[:id])
		@reviews = Review.joins(:user)
						 .select("reviews.*, users.name, users.profile_pic, users.id as user_id")
						 .where(market_id: @market.id)
		@review = Review.new
	end
end