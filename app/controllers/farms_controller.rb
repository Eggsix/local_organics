class LocsationController < ApplicationController
	def index
		@location = Farm.all
	end
	def new
		@location = Farm.new
	end
end