class UsersController < ApplicationController
	def show
		@user = User.find(current_user.id)
	end

	def update
		user = User.find(current_user.id)
		user.update(email: params[:email], interest: params[:interests])
		redirect_to "/users/#{user.id}"
	end
end