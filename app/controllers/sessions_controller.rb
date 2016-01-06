class SessionsController < ApplicationController
	def create
		auth = request.env["omniauth.auth"]
		session[:omniauth] = auth.except('extra')
		user = User.sign_in_from_omniauth(auth)
		
		session[:user_id] = user.id
		if session[:user_id]
			redirect_to root_url, notice: "SIGNED IN"
		else
			redirect_to root_url
		end
	end
	def destroy
		session[:user_id] = nil
		session[:omniauth] = nil
		redirect_to root_url, notice: "SIGNED OUT"
	end
end