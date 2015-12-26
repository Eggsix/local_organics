class MarketsController < ApplicationController
	def show
		@market = Market.find(params[:id])
		@reviews = Review.joins(:user)
						 .select("reviews.*, users.name, users.profile_pic")
						 .where(market_id: @market.id)
		@reviews.each do |x|
			puts x.name
		end
		@review = Review.new
	end
end